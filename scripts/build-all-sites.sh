#!/bin/bash

# Build script for multiple static sites
# This script builds each site configuration and combines them into a single deployment

set -e

echo "🚀 Building multiple static sites..."

# Create the main _site directory
mkdir -p _site

# Read the sites configuration
SITES_CONFIG="sites.json"

if [ ! -f "$SITES_CONFIG" ]; then
    echo "❌ No sites.json configuration found. Creating example configuration..."
    cat > "$SITES_CONFIG" << 'EOF'
{
  "sites": [
    {
      "name": "main",
      "config": "_config.yml",
      "domain": "yourdomain.com",
      "path": "",
      "description": "Main site"
    },
    {
      "name": "blog",
      "config": "sites/blog/_config.yml",
      "domain": "blog.yourdomain.com",
      "path": "blog",
      "description": "Blog site"
    },
    {
      "name": "portfolio",
      "config": "sites/portfolio/_config.yml", 
      "domain": "portfolio.yourdomain.com",
      "path": "portfolio",
      "description": "Portfolio site"
    }
  ]
}
EOF
    echo "✅ Created example sites.json. Please configure your sites and run again."
    exit 1
fi

# Install jq if not available
if ! command -v jq &> /dev/null; then
    echo "📦 Installing jq..."
    sudo apt-get update && sudo apt-get install -y jq
fi

# Install Jekyll dependencies
echo "📦 Installing Jekyll dependencies..."
bundle install

# Build each site
echo "🔨 Building individual sites..."

# Get the number of sites
SITE_COUNT=$(jq '.sites | length' "$SITES_CONFIG")

for ((i=0; i<$SITE_COUNT; i++)); do
    SITE_NAME=$(jq -r ".sites[$i].name" "$SITES_CONFIG")
    SITE_CONFIG=$(jq -r ".sites[$i].config" "$SITES_CONFIG")
    SITE_DOMAIN=$(jq -r ".sites[$i].domain" "$SITES_CONFIG")
    SITE_PATH=$(jq -r ".sites[$i].path" "$SITES_CONFIG")
    SITE_DESC=$(jq -r ".sites[$i].description" "$SITES_CONFIG")
    
    echo "🏗️  Building $SITE_NAME ($SITE_DESC)..."
    
    # Check if config file exists
    if [ ! -f "$SITE_CONFIG" ]; then
        echo "⚠️  Config file $SITE_CONFIG not found, skipping $SITE_NAME"
        continue
    fi
    
    # Build the site with specific config
    if [ "$SITE_PATH" = "" ] || [ "$SITE_PATH" = "null" ]; then
        # Main site goes to root
        echo "   Building to root directory..."
        bundle exec jekyll build --config "$SITE_CONFIG" --destination "_site"
    else
        # Subdirectory site
        echo "   Building to _site/$SITE_PATH..."
        mkdir -p "_site/$SITE_PATH"
        bundle exec jekyll build --config "$SITE_CONFIG" --destination "_site/$SITE_PATH"
    fi
    
    # Create domain redirect file if this is a subdirectory site
    if [ "$SITE_PATH" != "" ] && [ "$SITE_PATH" != "null" ]; then
        # Create a redirect page for domain-based access
        mkdir -p "_site/$SITE_PATH"
        cat > "_site/$SITE_PATH/CNAME" << EOF
$SITE_DOMAIN
EOF
    fi
    
    echo "✅ Built $SITE_NAME successfully"
done

# Create domain routing script
echo "🌐 Creating domain routing..."
cat > "_site/domain-router.js" << 'EOF'
(function() {
    'use strict';
    
    // Get current domain
    const currentDomain = window.location.hostname;
    const currentPath = window.location.pathname;
    
    // Site configurations - this should match your sites.json
    const siteConfigs = SITE_CONFIGS_PLACEHOLDER;
    
    // Find the correct site for this domain
    const currentSite = siteConfigs.find(site => 
        site.domain === currentDomain || 
        site.domain === currentDomain.replace('www.', '')
    );
    
    if (currentSite) {
        // If we're on the correct domain but wrong path, redirect
        if (currentSite.path && !currentPath.startsWith('/' + currentSite.path + '/')) {
            if (currentPath === '/' || currentPath === '') {
                window.location.href = '/' + currentSite.path + '/';
                return;
            }
        }
        
        // Prevent navigation to other domains
        document.addEventListener('click', function(e) {
            const link = e.target.closest('a');
            if (!link) return;
            
            const href = link.getAttribute('href');
            if (!href) return;
            
            // Check if this is a cross-domain link
            try {
                const linkUrl = new URL(href, window.location.origin);
                const linkDomain = linkUrl.hostname;
                
                // If linking to a different configured domain, prevent default and warn
                const targetSite = siteConfigs.find(site => 
                    site.domain === linkDomain || 
                    site.domain === linkDomain.replace('www.', '')
                );
                
                if (targetSite && targetSite.domain !== currentSite.domain) {
                    e.preventDefault();
                    console.warn('Cross-domain navigation prevented:', href);
                    alert('Navigation to ' + targetSite.description + ' is restricted. Please visit ' + targetSite.domain + ' directly.');
                    return false;
                }
            } catch (err) {
                // Invalid URL, let it proceed normally
            }
        });
    }
})();
EOF

# Replace placeholder with actual site configs
SITE_CONFIGS_JSON=$(jq '.sites' "$SITES_CONFIG")
sed -i "s/SITE_CONFIGS_PLACEHOLDER/$SITE_CONFIGS_JSON/g" "_site/domain-router.js"

# Create main index.html if it doesn't exist
if [ ! -f "_site/index.html" ]; then
    echo "📝 Creating main index.html..."
    cat > "_site/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi-Site Hub</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 800px; margin: 50px auto; padding: 20px; }
        .site-card { border: 1px solid #ddd; padding: 20px; margin: 20px 0; border-radius: 8px; }
        .site-card h3 { margin-top: 0; color: #333; }
        .site-card a { color: #0066cc; text-decoration: none; }
        .site-card a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>🌐 Multi-Site Hub</h1>
    <p>Welcome to the multi-site deployment. Select a site below:</p>
    <div id="sites-list"></div>
    
    <script>
        // Load site configurations and display them
        fetch('./sites.json')
            .then(response => response.json())
            .then(data => {
                const sitesList = document.getElementById('sites-list');
                data.sites.forEach(site => {
                    const siteCard = document.createElement('div');
                    siteCard.className = 'site-card';
                    siteCard.innerHTML = `
                        <h3>${site.name}</h3>
                        <p>${site.description}</p>
                        <p><strong>Domain:</strong> <a href="https://${site.domain}" target="_blank">${site.domain}</a></p>
                        ${site.path ? `<p><strong>Path:</strong> <a href="./${site.path}/">/${site.path}/</a></p>` : ''}
                    `;
                    sitesList.appendChild(siteCard);
                });
            })
            .catch(error => {
                console.error('Error loading sites configuration:', error);
                document.getElementById('sites-list').innerHTML = '<p>Error loading sites configuration.</p>';
            });
    </script>
</body>
</html>
EOF
fi

# Copy sites.json to _site for the hub page
cp "$SITES_CONFIG" "_site/"

echo "🎉 All sites built successfully!"
echo "📁 Output directory: _site/"
echo "🌐 Sites configured:"

for ((i=0; i<$SITE_COUNT; i++)); do
    SITE_NAME=$(jq -r ".sites[$i].name" "$SITES_CONFIG")
    SITE_DOMAIN=$(jq -r ".sites[$i].domain" "$SITES_CONFIG")
    SITE_PATH=$(jq -r ".sites[$i].path" "$SITES_CONFIG")
    
    if [ "$SITE_PATH" = "" ] || [ "$SITE_PATH" = "null" ]; then
        echo "   • $SITE_NAME: https://$SITE_DOMAIN (root)"
    else
        echo "   • $SITE_NAME: https://$SITE_DOMAIN → /$SITE_PATH/"
    fi
done