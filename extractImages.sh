#!/usr/bin/env bash

set -euo pipefail

PHOTOS_DIR="photos"

# Move images from one-level-deep folders into photos/
find "$PHOTOS_DIR" -mindepth 2 -maxdepth 2 -type f \
  \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
  -print0 |
while IFS= read -r -d '' file; do
  base="$(basename "$file")"
  dest="$PHOTOS_DIR/$base"

  # Avoid overwriting existing files
  if [[ -e "$dest" ]]; then
    name="${base%.*}"
    ext="${base##*.}"
    i=1
    while [[ -e "$PHOTOS_DIR/${name}_$i.$ext" ]]; do
      ((i++))
    done
    dest="$PHOTOS_DIR/${name}_$i.$ext"
  fi

  mv "$file" "$dest"
done

# OPTIONAL: remove empty subfolders
find "$PHOTOS_DIR" -mindepth 1 -maxdepth 1 -type d -empty -exec rmdir {} \;
