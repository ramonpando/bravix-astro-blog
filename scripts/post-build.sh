#!/bin/bash

# Post-build script to create symlink for assets
echo "Creating symlink for blog assets..."
cd dist/blog
ln -sf ../_astro _astro
echo "✓ Symlink created: dist/blog/_astro -> dist/_astro"