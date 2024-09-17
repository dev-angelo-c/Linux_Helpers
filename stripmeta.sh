#!/bin/bash
# Thank you again GPT and Imagemagick
# I wanted to strip the exif data from images
# Installation: sudo apt get imagemagick
# OS: Debian - Bookworm

for file in *.jpg *.jpeg *.png *.tiff; do
  # Check if the file exists (in case no files match)
  if [ -f "$file" ]; then
    # Remove metadata and overwrite the file using convert
    convert "$file" -strip "$file"
    echo "Stripped metadata from $file"
  fi
done
