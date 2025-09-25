#!/bin/bash

# Post-build script to create symlinks for assets
echo "Creating symlinks for blog assets..."
cd dist/blog

# Create symlink for _astro (JS/CSS bundles)
ln -sf ../_astro _astro
echo "✓ Symlink created: dist/blog/_astro -> dist/_astro"

# Create symlink for assets (logo, fonts, images)
ln -sf ../assets assets
echo "✓ Symlink created: dist/blog/assets -> dist/assets"