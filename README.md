# OralVision Website - Content Editing Guide

This guide will help you edit content on the OralVision website, even if you're new to programming.

## Table of Contents
- [Getting Started](#getting-started)
- [Running the Site Locally](#running-the-site-locally)
- [Editing Content Pages](#editing-content-pages)
- [Configuring the Base URL](#configuring-the-base-url)
- [Homepage Tiles](#homepage-tiles)
- [Adding Images](#adding-images)
- [Site Configuration](#site-configuration)
- [Deploying to GitHub Pages](#deploying-to-github-pages)

## Getting Started

### Prerequisites
- Ruby installed on your computer
- Git (for version control)

### Initial Setup
1. Install dependencies:
   ```bash
   bundle install
   ```

## Running the Site Locally

### For Local Development
1. **Important**: Set `baseurl` to an empty string in `_config.yml`:
   ```yaml
   baseurl: ""  # Empty string for local development
   ```

2. Build and serve the site:
   ```bash
   bundle exec jekyll serve
   ```

3. Open your browser and go to:
   ```
   http://localhost:4000/
   ```

### Viewing Changes
- Jekyll automatically rebuilds when you save files
- Refresh your browser to see changes
- If changes don't appear, stop the server (Ctrl+C) and restart it

## Editing Content Pages

All content pages are located in the `pages/` folder. They are Markdown files (`.md`).

### Page Structure

Each page has a "front matter" section at the top (between the `---` lines) that contains metadata:

```yaml
---
layout: post          # The layout template to use
title: Page Title     # The page title
description: Brief description for the tile
image: assets/images/pic01.jpg  # Image for the homepage tile
show-tile: true       # Whether to show this page as a tile on the homepage
tile_order: 1         # Order of the tile (1-6)
---
```

After the front matter, you write your content using Markdown.

### Available Pages

The site has these main content pages:
- `pages/oralvision-overview.md` - Overview page (tile_order: 1)
- `pages/the-problem.md` - The Problem page (tile_order: 2)
- `pages/our-solution.md` - Our Solution page (tile_order: 3)
- `pages/impact.md` - Impact page (tile_order: 4)
- `pages/goals-strategy.md` - Goals & Strategy page (tile_order: 5)
- `pages/people.md` - People/Team page (tile_order: 6)

### Editing a Page

1. Open the page file in the `pages/` folder (e.g., `pages/our-solution.md`)
2. Edit the content below the front matter section
3. Use Markdown syntax:
   - `# Heading 1` for main headings
   - `## Heading 2` for subheadings
   - `**bold**` for bold text
   - `*italic*` for italic text
   - `- Item` for bullet points
   - `1. Item` for numbered lists

4. Save the file
5. Check your browser - the page should update automatically

### Example Page

```markdown
---
layout: post
title: Our Solution
description: Brief description here
image: assets/images/pic05.jpg
show-tile: true
tile_order: 3
---

## Section Heading

Your content goes here. You can use **bold** and *italic* text.

- Bullet point 1
- Bullet point 2
```

## Configuring the Base URL

The `baseurl` setting in `_config.yml` tells Jekyll where your site is hosted.

### Local Development
Set `baseurl` to an empty string:
```yaml
baseurl: ""  # Empty for local development
```

### GitHub Pages Deployment
Set `baseurl` to your repository name:
```yaml
baseurl: "/oral-vision"  # Your GitHub repository name
```

**Important**: Always rebuild the site after changing `baseurl`:
```bash
bundle exec jekyll build
```

### Baseurl Validation

The repository includes an automatic check script that validates the baseurl configuration:

- **Before deploying**: The script will automatically run in GitHub Actions and **stop deployment** if baseurl is incorrect
- **Manually check**: You can run the check script locally:
  ```bash
  ruby scripts/check_baseurl.rb
  ```

The script will:
- ✅ **Pass** if baseurl is correct for the environment (empty for local, `/oral-vision` for GitHub Pages)
- ❌ **Fail** in CI/production if baseurl is not `/oral-vision`
- ⚠️ **Warn** locally if baseurl is set incorrectly

**Note**: The GitHub Actions workflow will automatically check baseurl before building and fail the deployment if it's incorrect, preventing broken deployments.

## Homepage Tiles

The homepage displays tiles (image cards) for your main pages. These are controlled by:

### Tile Settings

In each page's front matter:
- `show-tile: true` - Shows this page as a tile on the homepage
- `tile_order: 1` - Controls the order (1-6, where 1 appears first)
- `image: assets/images/pic01.jpg` - The image displayed on the tile
- `title:` - The title shown on the tile
- `description:` - The description shown on the tile

### Tile Order

The tiles are currently ordered as:
1. Overview (tile_order: 1)
2. The Problem (tile_order: 2)
3. Our Solution (tile_order: 3)
4. Impact (tile_order: 4)
5. Goals & Strategy (tile_order: 5)
6. People (tile_order: 6)

To change the order, modify the `tile_order` value in each page's front matter.

### Hiding a Page from Tiles

Set `show-tile: false` or remove the `show-tile` line entirely.

## Adding Images

### Where to Put Images
All images go in the `assets/images/` folder.

### Using Images in Pages

**In page content:**
```markdown
![Alt text](assets/images/your-image.jpg)
```

**For tile images (in front matter):**
```yaml
image: assets/images/pic01.jpg
```

### Image File Names
- Use lowercase letters, numbers, and hyphens
- Examples: `pic01.jpg`, `team-photo.png`, `banner-image.jpg`

## Site Configuration

The `_config.yml` file contains site-wide settings:

### Basic Settings
- `title:` - Site title (appears in browser tab)
- `description:` - Site description
- `email:` - Contact email

### Homepage Tiles
- `tiles-source: pages` - Use pages (not posts) for tiles
- `tiles-count: 6` - Number of tiles to show

### Important Notes
- **Always restart Jekyll** after changing `_config.yml`
- Stop the server (Ctrl+C) and run `bundle exec jekyll serve` again

## Deploying to GitHub Pages

### Before Deploying

1. **Set the baseurl** in `_config.yml`:
   ```yaml
   baseurl: "/oral-vision"  # Your repository name
   url: "https://akhaled247.github.io"
   ```

2. **Optional: Verify baseurl is correct:**
   ```bash
   ruby scripts/check_baseurl.rb
   ```
   This will check that baseurl is set correctly before you commit.

3. **Build the site:**
   ```bash
   bundle exec jekyll build
   ```

4. **Commit and push your changes:**
   ```bash
   git add .
   git commit -m "Update content"
   git push
   ```

5. **Automatic validation**: GitHub Actions will automatically check the baseurl configuration before building. If it's incorrect, the deployment will fail with an error message.

6. GitHub Pages will automatically rebuild and deploy your site (if baseurl check passes)

### After Deployment

Your site will be available at:
```
https://akhaled247.github.io/oral-vision/
```

## Common Tasks

### Adding a New Page

1. Create a new `.md` file in the `pages/` folder
2. Add front matter:
   ```yaml
   ---
   layout: post
   title: Your Page Title
   description: Description for tile
   image: assets/images/pic01.jpg
   show-tile: true  # Set to false to hide from homepage
   tile_order: 7    # Higher numbers appear later
   ---
   ```
3. Add your content below the front matter
4. Save the file

### Editing the Homepage

The homepage content is in `index.md`. Edit this file to change:
- The landing title
- The description text
- The mission and benefits sections

### Changing the Site Title

Edit `_config.yml`:
```yaml
title: OralVision  # Change this to your new title
```

Then restart Jekyll.

## Troubleshooting

### CSS/Images Not Loading Locally

**Problem**: CSS and images show as broken when running locally.

**Solution**: 
1. Make sure `baseurl: ""` is set (empty string) in `_config.yml`
2. Restart Jekyll server
3. Access the site at `http://localhost:4000/` (not `/oral-vision/`)

### Changes Not Appearing

1. Make sure you saved the file
2. Check the terminal for Jekyll errors
3. Try restarting Jekyll server
4. Hard refresh your browser (Ctrl+Shift+R or Cmd+Shift+R)

### Tiles Not Showing

1. Check that `show-tile: true` is in the page's front matter
2. Verify `tile_order` has a number value
3. Check `_config.yml` has `tiles-source: pages`
4. Make sure you have 6 or fewer pages with `show-tile: true`

## Getting Help

- Jekyll documentation: https://jekyllrb.com/docs/
- Markdown guide: https://www.markdownguide.org/
- GitHub Pages docs: https://docs.github.com/pages

## File Structure Quick Reference

```
forty-jekyll-theme/
├── _config.yml          # Site configuration (IMPORTANT: baseurl here)
├── index.md             # Homepage content
├── pages/               # Content pages (edit these!)
│   ├── oralvision-overview.md
│   ├── the-problem.md
│   ├── our-solution.md
│   ├── impact.md
│   ├── goals-strategy.md
│   └── people.md
├── assets/
│   └── images/          # Put images here
└── _site/               # Generated files (don't edit these!)
```

Remember: Edit files in `pages/` and `assets/images/`, not in `_site/`!

