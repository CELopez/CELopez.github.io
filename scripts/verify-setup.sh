#!/bin/bash

# Multi-Site Setup Verification Script
# Checks that all components are properly configured

set -e

echo "🔍 Verifying Multi-Site Setup..."
echo "================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check functions
check_file() {
    local file="$1"
    local description="$2"
    
    if [ -f "$file" ]; then
        echo -e "✅ ${GREEN}$description${NC}"
        return 0
    else
        echo -e "❌ ${RED}$description${NC}"
        return 1
    fi
}

check_dir() {
    local dir="$1"
    local description="$2"
    
    if [ -d "$dir" ]; then
        echo -e "✅ ${GREEN}$description${NC}"
        return 0
    else
        echo -e "❌ ${RED}$description${NC}"
        return 1
    fi
}

# Check required dependencies
echo "🔧 Checking Dependencies..."
echo "----------------------------"

# Check for jq
if command -v jq &> /dev/null; then
    echo -e "✅ ${GREEN}jq is installed${NC}"
else
    echo -e "❌ ${RED}jq is not installed${NC}"
    echo "   Install with: sudo apt-get install jq"
fi

# Check for bundle
if command -v bundle &> /dev/null; then
    echo -e "✅ ${GREEN}Bundler is available${NC}"
else
    echo -e "⚠️  ${YELLOW}Bundler not found - run 'gem install bundler'${NC}"
fi

echo ""

# Check core configuration files
echo "📋 Checking Configuration Files..."
echo "-----------------------------------"

check_file "sites.json" "sites.json configuration exists"
check_file "_config.yml" "Main site configuration exists"
check_file "sites/blog/_config.yml" "Blog configuration exists"
check_file "sites/portfolio/_config.yml" "Portfolio configuration exists"

echo ""

# Check build system
echo "🔨 Checking Build System..."
echo "----------------------------"

check_file "scripts/build-all-sites.sh" "Build script exists"
check_file ".github/workflows/deploy-sites.yml" "GitHub Actions workflow exists"

# Check if build script is executable
if [ -x "scripts/build-all-sites.sh" ]; then
    echo -e "✅ ${GREEN}Build script is executable${NC}"
else
    echo -e "❌ ${RED}Build script is not executable${NC}"
    echo "   Fix with: chmod +x scripts/build-all-sites.sh"
fi

echo ""

# Check domain protection
echo "🔒 Checking Domain Protection..."
echo "---------------------------------"

check_file "_includes/domain-navigation-guard.html" "Domain navigation guard exists"

echo ""

# Check content structure
echo "📝 Checking Content Structure..."
echo "---------------------------------"

check_dir "sites/blog/_posts" "Blog posts directory exists"
check_dir "sites/portfolio/_portfolio" "Portfolio items directory exists"
check_file "sites/blog/index.html" "Blog homepage exists"
check_file "sites/portfolio/index.html" "Portfolio homepage exists"

echo ""

# Validate JSON configuration
echo "🧪 Validating Configuration..."
echo "-------------------------------"

if command -v jq &> /dev/null; then
    if jq empty sites.json 2>/dev/null; then
        echo -e "✅ ${GREEN}sites.json is valid JSON${NC}"
        
        # Check site count
        SITE_COUNT=$(jq '.sites | length' sites.json)
        echo -e "✅ ${GREEN}Found $SITE_COUNT configured sites${NC}"
        
        # List configured sites
        echo "📋 Configured sites:"
        jq -r '.sites[] | "   • \(.name): \(.domain) → /\(.path)"' sites.json
        
    else
        echo -e "❌ ${RED}sites.json contains invalid JSON${NC}"
    fi
else
    echo -e "⚠️  ${YELLOW}Cannot validate JSON without jq${NC}"
fi

echo ""

# Check for common issues
echo "⚠️  Checking for Common Issues..."
echo "----------------------------------"

# Check for placeholder domains
if grep -q "yourdomain.com" sites.json _config.yml sites/*/config.yml 2>/dev/null; then
    echo -e "⚠️  ${YELLOW}Found placeholder domains - update with your actual domains${NC}"
else
    echo -e "✅ ${GREEN}No placeholder domains found${NC}"
fi

# Check CNAME file
if [ -f "CNAME" ]; then
    CNAME_DOMAIN=$(cat CNAME)
    echo -e "✅ ${GREEN}CNAME file exists with domain: $CNAME_DOMAIN${NC}"
    
    # Check if CNAME matches main site domain
    MAIN_DOMAIN=$(jq -r '.sites[] | select(.name == "main") | .domain' sites.json 2>/dev/null || echo "")
    if [ "$CNAME_DOMAIN" = "$MAIN_DOMAIN" ]; then
        echo -e "✅ ${GREEN}CNAME matches main site domain${NC}"
    else
        echo -e "⚠️  ${YELLOW}CNAME ($CNAME_DOMAIN) doesn't match main site domain ($MAIN_DOMAIN)${NC}"
    fi
else
    echo -e "⚠️  ${YELLOW}No CNAME file found - create one with your main domain${NC}"
fi

echo ""

# Final summary
echo "🎯 Setup Summary..."
echo "-------------------"

# Count checks
TOTAL_FILES=11
EXISTING_FILES=0

# Check existence of key files
[ -f "sites.json" ] && ((EXISTING_FILES++))
[ -f "_config.yml" ] && ((EXISTING_FILES++))
[ -f "sites/blog/_config.yml" ] && ((EXISTING_FILES++))
[ -f "sites/portfolio/_config.yml" ] && ((EXISTING_FILES++))
[ -f "scripts/build-all-sites.sh" ] && ((EXISTING_FILES++))
[ -f ".github/workflows/deploy-sites.yml" ] && ((EXISTING_FILES++))
[ -f "_includes/domain-navigation-guard.html" ] && ((EXISTING_FILES++))
[ -d "sites/blog/_posts" ] && ((EXISTING_FILES++))
[ -d "sites/portfolio/_portfolio" ] && ((EXISTING_FILES++))
[ -f "sites/blog/index.html" ] && ((EXISTING_FILES++))
[ -f "sites/portfolio/index.html" ] && ((EXISTING_FILES++))

echo "✅ Files: $EXISTING_FILES/$TOTAL_FILES"

if [ $EXISTING_FILES -eq $TOTAL_FILES ]; then
    echo -e "${GREEN}🎉 Multi-site setup is complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Update domain names in sites.json and config files"
    echo "2. Configure DNS records for your domains"
    echo "3. Add your content to the blog and portfolio"
    echo "4. Push to GitHub to trigger deployment"
    echo "5. Enable GitHub Pages in repository settings"
else
    echo -e "${YELLOW}⚠️  Setup is incomplete - see errors above${NC}"
fi

echo ""
echo "📚 For more information, see MULTI_SITE_SETUP.md"