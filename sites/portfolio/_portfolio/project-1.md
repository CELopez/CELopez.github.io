---
title: "Multi-Site Jekyll Setup"
excerpt: "A sophisticated Jekyll-based system for hosting multiple static sites with domain-based separation."
header:
  image: /assets/images/portfolio/multi-site-project.jpg
  teaser: /assets/images/portfolio/multi-site-project-teaser.jpg
sidebar:
  - title: "Technologies"
    text: "Jekyll, GitHub Actions, JavaScript, Bash"
  - title: "Project Type"
    text: "Web Development / DevOps"
  - title: "Status"
    text: "Active"
gallery:
  - url: /assets/images/portfolio/multi-site-architecture.jpg
    image_path: /assets/images/portfolio/multi-site-architecture-thumb.jpg
    alt: "Multi-site architecture diagram"
  - url: /assets/images/portfolio/domain-guard-demo.jpg
    image_path: /assets/images/portfolio/domain-guard-demo-thumb.jpg
    alt: "Domain navigation guard in action"
---

## Project Overview

This project implements a sophisticated multi-site Jekyll setup that allows hosting multiple independent static websites from a single repository. Each site can have its own domain while maintaining complete separation between them.

### Key Features

- **Multi-Site Architecture**: Build and deploy multiple Jekyll sites from one repository
- **Domain-Based Separation**: Each site operates on its own domain with restricted cross-navigation
- **Automated Deployment**: GitHub Actions workflow for seamless CI/CD
- **Navigation Guard**: JavaScript-based protection against accidental cross-domain navigation
- **Flexible Configuration**: JSON-based site configuration system

### Technical Implementation

The solution consists of several key components:

1. **Build System**: Custom bash script that reads site configurations and builds each Jekyll site independently
2. **GitHub Actions**: Automated workflow that builds all sites and deploys them to GitHub Pages
3. **Domain Router**: JavaScript module that handles domain-specific routing and navigation protection
4. **Site Configurations**: Individual Jekyll configs for each site with unique themes and settings

### Architecture Highlights

```yaml
# Example sites.json configuration
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
    }
  ]
}
```

### Domain Navigation Protection

The system includes a sophisticated JavaScript-based navigation guard that:

- Detects cross-domain link clicks
- Prevents navigation between configured domains
- Shows user-friendly notifications
- Maintains site focus and analytics integrity

### Benefits

- **SEO Optimization**: Each site maintains its own domain authority
- **Content Separation**: Clear boundaries between different types of content
- **Maintenance Efficiency**: Single repository for multiple sites
- **Deployment Simplicity**: Automated builds and deployments
- **Cost Effective**: Free hosting with GitHub Pages

## Technologies Used

- **Jekyll**: Static site generator
- **GitHub Actions**: CI/CD automation
- **JavaScript**: Client-side navigation control
- **Bash**: Build automation scripts
- **JSON**: Configuration management

## Links

- [GitHub Repository](https://github.com/your-username/multi-site-setup)
- [Live Demo - Main Site](https://yourdomain.com)
- [Live Demo - Blog](https://blog.yourdomain.com) 
- [Documentation](https://github.com/your-username/multi-site-setup/wiki)

## Lessons Learned

This project taught me valuable lessons about:

- **System Architecture**: Designing scalable multi-site solutions
- **DevOps**: Implementing efficient CI/CD pipelines
- **User Experience**: Balancing functionality with usability
- **Domain Management**: Handling multiple domains in a single deployment

The result is a robust, maintainable system that can easily scale to support additional sites while maintaining clear separation and excellent user experience.