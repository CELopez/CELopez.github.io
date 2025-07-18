# 🌐 Multi-Site Jekyll Setup

This repository is configured to host multiple static websites from a single codebase using Jekyll and GitHub Pages. Each site can have its own domain and is protected from cross-domain navigation.

## 🏗️ Architecture Overview

The system builds multiple Jekyll sites from different configurations and combines them into a single deployment. Each site operates independently with domain-based separation.

### Sites Structure
```
├── _config.yml                 # Main site configuration
├── sites.json                  # Multi-site configuration
├── sites/
│   ├── blog/
│   │   ├── _config.yml         # Blog-specific config
│   │   ├── _posts/             # Blog posts
│   │   └── index.html          # Blog homepage
│   └── portfolio/
│       ├── _config.yml         # Portfolio-specific config
│       ├── _portfolio/         # Portfolio items
│       └── index.html          # Portfolio homepage
├── scripts/
│   └── build-all-sites.sh     # Build automation
└── .github/workflows/
    └── deploy-sites.yml        # CI/CD pipeline
```

## 🚀 Quick Start

### 1. Configure Your Sites

Edit `sites.json` to define your sites:

```json
{
  "sites": [
    {
      "name": "main",
      "config": "_config.yml",
      "domain": "yourdomain.com",
      "path": "",
      "description": "Main website"
    },
    {
      "name": "blog",
      "config": "sites/blog/_config.yml",
      "domain": "blog.yourdomain.com",
      "path": "blog",
      "description": "Personal blog"
    },
    {
      "name": "portfolio",
      "config": "sites/portfolio/_config.yml",
      "domain": "portfolio.yourdomain.com",
      "path": "portfolio",
      "description": "Portfolio showcase"
    }
  ]
}
```

### 2. Update Site Configurations

For each site, update the corresponding `_config.yml` file:

**Main Site (`_config.yml`)**:
```yaml
title: "Your Name"
description: "Your main website description"
url: "https://yourdomain.com"
baseurl: ""
```

**Blog Site (`sites/blog/_config.yml`)**:
```yaml
title: "Your Blog"
description: "Your blog description"
url: "https://blog.yourdomain.com"
baseurl: "/blog"
```

**Portfolio Site (`sites/portfolio/_config.yml`)**:
```yaml
title: "Your Portfolio"
description: "Your portfolio description"
url: "https://portfolio.yourdomain.com"
baseurl: "/portfolio"
```

### 3. Set Up GitHub Pages

1. Go to your repository settings
2. Navigate to "Pages" section
3. Set source to "GitHub Actions"
4. The workflow will automatically deploy on push to main/master

### 4. Configure Domains

For custom domains:

1. Add CNAME records in your DNS:
   - `yourdomain.com` → `your-username.github.io`
   - `blog.yourdomain.com` → `your-username.github.io`
   - `portfolio.yourdomain.com` → `your-username.github.io`

2. Add domain files if needed:
   - Create `CNAME` file in root with your main domain
   - The build script handles subdomain routing

## 🔧 Features

### Domain Navigation Protection

The system includes JavaScript-based navigation protection that:

- **Prevents Cross-Domain Navigation**: Links between different configured domains are blocked
- **User-Friendly Notifications**: Shows clear messages when navigation is restricted
- **Visual Indicators**: Displays domain protection status
- **Maintains Site Focus**: Keeps users within the intended site experience

### Automated Build System

The `build-all-sites.sh` script:

- Reads configuration from `sites.json`
- Builds each Jekyll site independently
- Combines all sites into a single `_site` directory
- Generates domain routing configuration
- Creates a hub page for development/testing

### GitHub Actions Workflow

The CI/CD pipeline:

- Triggers on push to main/master branch
- Sets up Ruby and Node.js environments
- Installs dependencies
- Builds all sites using the build script
- Deploys to GitHub Pages

## 📝 Adding New Sites

To add a new site:

1. **Create Site Directory**:
   ```bash
   mkdir -p sites/newsite
   ```

2. **Add Configuration**:
   ```yaml
   # sites/newsite/_config.yml
   title: "New Site"
   description: "Description of new site"
   url: "https://newsite.yourdomain.com"
   baseurl: "/newsite"
   ```

3. **Update sites.json**:
   ```json
   {
     "name": "newsite",
     "config": "sites/newsite/_config.yml",
     "domain": "newsite.yourdomain.com",
     "path": "newsite",
     "description": "New Site"
   }
   ```

4. **Create Content**:
   - Add `index.html` or `index.md`
   - Include the domain navigation guard
   - Add any site-specific content

5. **Configure DNS**:
   - Add CNAME record: `newsite.yourdomain.com` → `your-username.github.io`

## 🎨 Customization

### Themes and Styling

Each site can use different:
- Minimal Mistakes skins
- Custom CSS overrides
- Layout configurations
- Color schemes

### Content Types

Supported content includes:
- **Blog Posts**: Markdown files in `_posts/`
- **Portfolio Items**: Collection items in `_portfolio/`
- **Pages**: Static pages and custom layouts
- **Collections**: Custom content types

### Navigation

Each site maintains independent navigation:
- Site-specific menus
- Custom footer links
- Breadcrumb navigation
- Category/tag archives

## 🔍 Development

### Local Development

1. **Install Dependencies**:
   ```bash
   bundle install
   npm install
   ```

2. **Build All Sites**:
   ```bash
   chmod +x scripts/build-all-sites.sh
   ./scripts/build-all-sites.sh
   ```

3. **Serve Locally**:
   ```bash
   bundle exec jekyll serve --source _site --skip-initial-build
   ```

### Testing

Test the multi-site setup:

1. Access the hub page at `http://localhost:4000`
2. Navigate to individual sites
3. Verify domain protection is working
4. Check cross-site link prevention

## 🚨 Troubleshooting

### Common Issues

**Build Fails**:
- Check `sites.json` syntax
- Verify all config files exist
- Ensure Ruby/Node.js versions are compatible

**Domain Protection Not Working**:
- Verify domain configuration in `sites.json`
- Check browser console for JavaScript errors
- Ensure `domain-navigation-guard.html` is included

**Sites Not Accessible**:
- Check DNS configuration
- Verify CNAME records
- Ensure GitHub Pages is enabled

### Debug Mode

Enable debug logging in the build script:
```bash
DEBUG=1 ./scripts/build-all-sites.sh
```

## 📚 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Minimal Mistakes Theme](https://mmistakes.github.io/minimal-mistakes/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Custom Domain Setup](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the multi-site build
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎯 Next Steps

After setup:

1. **Customize Content**: Add your own posts, projects, and pages
2. **Configure Analytics**: Set up tracking for each site
3. **Optimize SEO**: Add meta tags and structured data
4. **Add Features**: Integrate comments, search, or other functionality
5. **Monitor Performance**: Set up monitoring and analytics

---

**Need Help?** Check the [Issues](https://github.com/your-username/your-repo/issues) page or create a new issue for support.