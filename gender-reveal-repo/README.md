# 🎉 Gender Reveal Website

A beautiful, interactive static website for sharing your gender reveal announcement with family and friends.

## 🌟 Features

- **Interactive Reveal**: Click/tap to reveal the gender with animations
- **Beautiful Design**: Modern, mobile-responsive layout
- **Photo Gallery**: Share ultrasound photos and moments
- **Timeline**: Share your pregnancy journey
- **RSVP System**: Collect responses for your reveal party (via forms)
- **Social Sharing**: Built-in social media sharing buttons
- **Countdown Timer**: Count down to the big reveal moment
- **Customizable**: Easy to personalize colors, text, and images

## 🚀 Quick Start

1. **Enable GitHub Pages**:
   - Go to repository Settings → Pages
   - Set source to "Deploy from a branch"
   - Select "main" branch and "/ (root)" folder
   - Save

2. **Custom Domain** (optional):
   - Add your domain to the `CNAME` file
   - Configure DNS: `reveal.yourdomain.com CNAME username.github.io`

3. **Customize Your Site**:
   - Edit `_config.yml` with your information
   - Replace images in `assets/images/`
   - Update content in the HTML files

## 📋 Customization Guide

### 1. Basic Information (`_config.yml`)

```yaml
# Parents' Information
parent1_name: "Sarah"
parent2_name: "Mike"
last_name: "Johnson"

# Baby Information  
due_date: "2024-07-15"
reveal_date: "2024-03-15"

# Reveal Information
gender: "boy" # "boy" or "girl" - THIS IS THE BIG SECRET!
baby_name: "Oliver" # Optional: if you want to reveal the name too

# Party Information
party_date: "2024-03-15"
party_time: "2:00 PM"
party_location: "123 Main St, Your City, State"
party_rsvp_email: "sarah.mike@example.com"

# Social Media
social_sharing: true
hashtag: "#BabyJohnsonReveal"

# Colors (customize to your preference)
primary_color: "#ff6b9d" # Pink for girl, "#4dabf7" for boy
secondary_color: "#69db7c"
accent_color: "#ffd43b"
```

### 2. Images to Replace

Place your images in the `assets/images/` folder:

```
assets/images/
├── hero-background.jpg         # Main background image
├── parents-photo.jpg           # Photo of expectant parents
├── ultrasound/
│   ├── ultrasound-1.jpg       # Ultrasound photos
│   ├── ultrasound-2.jpg
│   └── ultrasound-3.jpg
├── pregnancy-journey/
│   ├── announcement.jpg        # Pregnancy announcement photo
│   ├── first-appointment.jpg   # First doctor visit
│   ├── gender-appointment.jpg  # Gender reveal appointment
│   └── baby-items.jpg         # Baby preparation photos
├── reveal/
│   ├── boy-reveal.jpg         # Image shown if it's a boy
│   ├── girl-reveal.jpg        # Image shown if it's a girl
│   └── neutral-before.jpg     # Image shown before reveal
└── party/
    ├── decorations.jpg        # Party decoration ideas
    ├── cake.jpg              # Gender reveal cake
    └── setup.jpg             # Party setup
```

### 3. Page Sections

The site includes these sections you can customize:

#### Hero Section (`index.html`)
- Welcome message
- Countdown timer
- Main reveal button

#### About Us Section
- Parents' story
- Pregnancy journey
- Fun facts about baby

#### Timeline Section
- Pregnancy milestones
- Important dates
- Medical appointments

#### Photo Gallery
- Ultrasound images
- Pregnancy photos
- Preparation moments

#### The Big Reveal
- Interactive reveal button
- Gender announcement
- Celebration animations

#### Party Details
- Date, time, location
- RSVP information
- What to expect

#### RSVP Form
- Guest responses
- Special dietary needs
- Contact information

## 🎨 Color Themes

### Pink Theme (Girl)
```css
:root {
  --primary-color: #ff6b9d;
  --secondary-color: #fcc2d7;
  --accent-color: #ffd43b;
  --text-color: #2d3436;
}
```

### Blue Theme (Boy)
```css
:root {
  --primary-color: #4dabf7;
  --secondary-color: #74c0fc;
  --accent-color: #69db7c;
  --text-color: #2d3436;
}
```

### Neutral Theme (Before Reveal)
```css
:root {
  --primary-color: #6c5ce7;
  --secondary-color: #a29bfe;
  --accent-color: #ffeaa7;
  --text-color: #2d3436;
}
```

## 🧩 Interactive Features

### 1. Reveal Button
The main reveal button includes:
- Hover animations
- Click/tap interactions
- Confetti animations
- Gender-specific colors and messages

### 2. Countdown Timer
Automatically counts down to your reveal date:
```javascript
// Countdown to reveal date
const revealDate = new Date('2024-03-15T14:00:00');
// Updates every second with days, hours, minutes, seconds
```

### 3. Photo Gallery
- Lightbox functionality
- Swipe/keyboard navigation
- Responsive grid layout
- Caption support

### 4. RSVP Form
Options for RSVP handling:
- **Netlify Forms** (free, easy setup)
- **Formspree** (free tier available)
- **Google Forms** (embed or redirect)
- **Email mailto** (simple fallback)

## 📱 Mobile Responsive

The site is fully responsive and works beautifully on:
- **Desktop**: Full-width layouts with hover effects
- **Tablet**: Touch-friendly interactions, optimized spacing
- **Mobile**: Swipe gestures, thumb-friendly buttons

## 🎊 Animation Effects

### Reveal Animations
- **Confetti**: Colorful confetti explosion
- **Balloons**: Floating balloons animation
- **Fade In**: Smooth gender reveal
- **Bounce**: Playful text animations

### Interaction Animations
- **Hover Effects**: Button and image hover states
- **Scroll Animations**: Elements appear as you scroll
- **Loading States**: Smooth transitions between sections

## 📧 Social Sharing

Built-in sharing for:
- **Facebook**: Share with custom message
- **Twitter**: Tweet with hashtag
- **Instagram**: Share story (copy link)
- **WhatsApp**: Share with family groups
- **Email**: Send announcement via email

## 🔧 Technical Details

### Built With
- **HTML5**: Semantic markup
- **CSS3**: Modern styling with flexbox/grid
- **JavaScript**: Interactive features and animations
- **Jekyll**: Static site generation (optional)
- **GitHub Pages**: Free hosting

### File Structure
```
├── index.html              # Main page
├── assets/
│   ├── css/
│   │   └── main.css       # All styles
│   ├── js/
│   │   └── main.js        # Interactive features
│   └── images/            # All photos
├── _config.yml            # Site configuration
├── CNAME                  # Custom domain
└── README.md              # This file
```

### Performance
- **Optimized Images**: Compressed for fast loading
- **Minimal JavaScript**: Only what's needed for interactions
- **CSS Grid/Flexbox**: Modern, efficient layouts
- **Mobile First**: Designed for mobile performance

## 🎯 Setup Examples

### Example 1: Simple Reveal
Just the essentials:
- Hero section with reveal button
- Basic information
- Contact details

### Example 2: Full Experience
Complete website with:
- Photo timeline
- Interactive gallery
- Party information
- RSVP system

### Example 3: Post-Reveal
After the reveal:
- Show the results
- Share photos from the event
- Thank you message

## 🆘 Troubleshooting

**Images not loading?**
- Check file paths match exactly
- Ensure images are in `assets/images/`
- Verify image file extensions are correct

**Reveal button not working?**
- Check JavaScript console for errors
- Ensure `gender` is set in `_config.yml`
- Verify button ID matches JavaScript

**Site not updating?**
- Check GitHub Pages build status
- Ensure all files are committed
- Wait a few minutes for changes to propagate

**Mobile issues?**
- Test responsive breakpoints
- Check touch event handlers
- Verify viewport meta tag

## 🎁 Bonus Features

### Password Protection
Add a simple password to keep the reveal secret:
```javascript
const password = prompt("Enter the secret password:");
if (password !== "BabyJohnson2024") {
  // Redirect or hide content
}
```

### Visitor Counter
Track how many people have visited:
- Google Analytics
- Simple visitor counter
- Heat map tracking

### Guest Book
Let visitors leave messages:
- Comment system
- Guest book form
- Social media integration

## 🌟 Inspiration Ideas

### Themes
- **Storybook**: Fairy tale design
- **Vintage**: Classic, elegant styling
- **Modern**: Clean, minimalist
- **Rustic**: Natural, earthy colors
- **Whimsical**: Playful, cartoon-style

### Reveal Methods
- **Button Click**: Traditional reveal button
- **Scroll Reveal**: Reveal as you scroll down
- **Quiz Format**: Answer questions to reveal
- **Countdown**: Automatic reveal at specific time
- **Photo Puzzle**: Piece together the announcement

---

**Congratulations on your upcoming bundle of joy! 👶✨**

*Need help customizing your site? Check the issues section or reach out for support!*