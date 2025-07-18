# 📝 Personal Blog

A simple Jekyll blog using the Minimal Mistakes theme, ready for GitHub Pages deployment.

## 🚀 Quick Start

1. **Enable GitHub Pages**:
   - Go to repository Settings → Pages
   - Set source to "Deploy from a branch"
   - Select "main" branch and "/ (root)" folder
   - Save

2. **Custom Domain** (optional):
   - Add your domain to the `CNAME` file
   - Configure DNS: `blog.yourdomain.com CNAME username.github.io`

3. **Start Writing**:
   - Add posts to `_posts/` folder
   - Follow the naming convention: `YYYY-MM-DD-title.md`

## ✍️ Creating Blog Posts

### 1. Basic Post Structure

Create a new file in `_posts/` with the format: `YYYY-MM-DD-your-post-title.md`

```markdown
---
title: "Your Post Title"
date: 2024-01-15
categories:
  - Technology
  - Personal
tags:
  - jekyll
  - blogging
  - tutorial
excerpt: "A brief description of your post that appears in previews."
header:
  overlay_image: /assets/images/post-header.jpg
  overlay_filter: 0.5
---

Your post content goes here...
```

### 2. Post Front Matter Options

The section between `---` lines is called "front matter" and controls how your post appears:

```yaml
---
title: "Required: Your Post Title"
date: 2024-01-15                    # Required: YYYY-MM-DD
categories:                         # Optional: for organization
  - Technology
  - Tutorial
tags:                              # Optional: for searchability  
  - jekyll
  - coding
  - tips
excerpt: "Brief description..."     # Optional: preview text
author_profile: true               # Optional: show author bio
read_time: true                    # Optional: show estimated read time
comments: true                     # Optional: enable comments
share: true                        # Optional: show share buttons
related: true                      # Optional: show related posts
toc: true                         # Optional: table of contents
toc_label: "Contents"             # Optional: TOC title
toc_icon: "file-text"             # Optional: TOC icon
header:
  overlay_image: /assets/images/header.jpg  # Optional: header image
  overlay_filter: 0.5                      # Optional: darken header image
  teaser: /assets/images/teaser.jpg        # Optional: preview image
  actions:                                 # Optional: header buttons
    - label: "Learn More"
      url: "https://example.com"
---
```

## 📸 Adding Images

### 1. Image Storage
Store images in the `assets/images/` folder:
```
assets/
  images/
    posts/
      2024-01-15-my-vacation.jpg
    headers/
      tech-header.jpg
    teasers/
      project-teaser.jpg
```

### 2. Using Images in Posts

**Simple Image:**
```markdown
![Alt text](/assets/images/posts/my-photo.jpg)
```

**Image with Caption:**
```markdown
![Alt text](/assets/images/posts/my-photo.jpg)
*Caption: This is a beautiful sunset*
```

**Responsive Image (Recommended):**
```markdown
{% include figure image_path="/assets/images/posts/my-photo.jpg" alt="Alt text" caption="This is a beautiful sunset" %}
```

**Image Gallery:**
```markdown
{% include gallery id="gallery1" caption="My vacation photos" %}
```

Then define the gallery in your front matter:
```yaml
gallery1:
  - url: /assets/images/posts/vacation1.jpg
    image_path: /assets/images/posts/vacation1-thumb.jpg
    alt: "Beach photo"
    title: "Beautiful beach"
  - url: /assets/images/posts/vacation2.jpg  
    image_path: /assets/images/posts/vacation2-thumb.jpg
    alt: "Mountain photo"
    title: "Mountain view"
```

## 📝 Markdown Guide

### Headers
```markdown
# H1 Header
## H2 Header  
### H3 Header
#### H4 Header
```

### Text Formatting
```markdown
**Bold text**
*Italic text*
***Bold and italic***
~~Strikethrough~~
`Inline code`
```

### Links
```markdown
[Link text](https://example.com)
[Link with title](https://example.com "Tooltip text")
[Internal link](/about/)
```

### Lists
```markdown
**Unordered:**
- Item 1
- Item 2
  - Nested item
  - Another nested item

**Ordered:**
1. First item
2. Second item
   1. Nested numbered item
   2. Another nested item

**Task Lists:**
- [x] Completed task
- [ ] Incomplete task
```

### Code Blocks
````markdown
**Inline code:** `console.log('hello')`

**Code block:**
```javascript
function greet(name) {
  console.log(`Hello, ${name}!`);
}
greet('World');
```

**Code block with line numbers:**
```javascript
{% raw %}{% highlight javascript linenos %}
function calculate(a, b) {
  return a + b;
}
{% endhighlight %}{% endraw %}
```
````

### Quotes
```markdown
> This is a blockquote
> 
> It can span multiple lines

> **Author Name**
> 
> This quote has attribution
```

### Tables
```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | More data|
| Row 2    | Info     | Details  |

**Aligned columns:**
| Left | Center | Right |
|:-----|:------:|------:|
| Text | Text   | Text  |
```

### Horizontal Rule
```markdown
---
```

### Line Breaks
```markdown
End a line with two spaces  
to create a line break.

Or use a blank line

to create a paragraph break.
```

## 🎨 Special Jekyll Features

### Include Files
```markdown
{% raw %}{% include video id="dQw4w9WgXcQ" provider="youtube" %}{% endraw %}

{% raw %}{% include figure image_path="/assets/images/photo.jpg" alt="Alt text" caption="Caption text" %}{% endraw %}
```

### Notices/Callouts
```markdown
**Note:** This is a note
{: .notice}

**Info:** This is informational
{: .notice--info}

**Warning:** This is a warning
{: .notice--warning}

**Danger:** This is dangerous
{: .notice--danger}

**Success:** This worked great!
{: .notice--success}
```

### Buttons
```markdown
[Button Text](https://example.com){: .btn}
[Primary Button](https://example.com){: .btn .btn--primary}
[Large Button](https://example.com){: .btn .btn--large}
```

### Text Alignment
```markdown
Left-aligned text (default)

Center-aligned text
{: .text-center}

Right-aligned text  
{: .text-right}

Justified text spreads across the full width
{: .text-justify}
```

## 📱 Social Media & Embeds

### YouTube Videos
```markdown
{% raw %}{% include video id="dQw4w9WgXcQ" provider="youtube" %}{% endraw %}
```

### Twitter Tweets
```markdown
{% raw %}{% twitter https://twitter.com/username/status/123456789 %}{% endraw %}
```

### GitHub Gists
```markdown
{% raw %}{% gist username/gist-id %}{% endraw %}
```

## 📂 Organizing Content

### Categories vs Tags
- **Categories**: Broad topics (Technology, Travel, Personal)
- **Tags**: Specific keywords (jekyll, vacation, tutorial)

### Creating Category Pages
Create files like `_pages/category-technology.md`:
```markdown
---
title: "Technology Posts"
layout: category
permalink: /categories/technology/
taxonomy: Technology
---
```

### Creating Tag Pages  
Create files like `_pages/tag-jekyll.md`:
```markdown
---
title: "Jekyll Posts"
layout: tag
permalink: /tags/jekyll/
taxonomy: jekyll
---
```

## 🎯 Example Posts

### Tech Tutorial Post
```markdown
---
title: "How to Build a Jekyll Blog"
date: 2024-01-15
categories:
  - Technology
  - Tutorial
tags:
  - jekyll
  - github-pages
  - blogging
excerpt: "Step-by-step guide to creating your own Jekyll blog."
toc: true
header:
  overlay_image: /assets/images/headers/jekyll-header.jpg
  overlay_filter: 0.5
---

# Introduction

In this tutorial, you'll learn how to...

## Prerequisites

Before we start, make sure you have:
- A GitHub account
- Basic knowledge of Markdown

## Step 1: Setup

First, we need to...

```bash
git clone https://github.com/username/blog
cd blog
```

## Conclusion

You now have a fully functional blog!
```

### Personal Story Post
```markdown
---
title: "My Trip to Japan"
date: 2024-01-10
categories:
  - Travel
  - Personal
tags:
  - japan
  - travel
  - photography
excerpt: "Amazing adventures in the land of the rising sun."
header:
  overlay_image: /assets/images/posts/japan-header.jpg
  overlay_filter: 0.3
gallery:
  - url: /assets/images/posts/tokyo-tower.jpg
    image_path: /assets/images/posts/tokyo-tower-thumb.jpg
    alt: "Tokyo Tower at night"
  - url: /assets/images/posts/mt-fuji.jpg
    image_path: /assets/images/posts/mt-fuji-thumb.jpg
    alt: "Mount Fuji view"
---

Last month, I had the incredible opportunity to visit Japan...

{% include gallery caption="Photos from my Japan trip" %}

The highlight of my trip was definitely...
```

## 🔧 Configuration

Edit `_config.yml` to customize your blog:

```yaml
title: "Your Blog Name"
description: "Your blog description"
url: "https://blog.yourdomain.com"
author:
  name: "Your Name"
  bio: "Brief bio about yourself"
  avatar: "/assets/images/bio-photo.jpg"
```

## 📚 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Minimal Mistakes Documentation](https://mmistakes.github.io/minimal-mistakes/)
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [YAML Front Matter](https://jekyllrb.com/docs/front-matter/)

## 🆘 Troubleshooting

**Site not updating?**
- Check that your post date isn't in the future
- Ensure filename follows `YYYY-MM-DD-title.md` format
- Verify front matter has proper YAML syntax

**Images not loading?**
- Check file paths are correct
- Ensure images are in `assets/images/` folder
- Verify image filenames match exactly (case-sensitive)

**Build errors?**
- Check for typos in `_config.yml`
- Ensure all front matter uses proper YAML syntax
- Look for unclosed quotes or missing colons

---

Happy blogging! 🎉