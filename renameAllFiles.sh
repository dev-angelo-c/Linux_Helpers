#!/bin/bash

# Thank you ChatGPT
# I wanted to duplicate some features OSX has in their OS GUI.
# TODO: Pass arguments to specify delimiter and fileName

# Initialize the counter
n=1

# Loop through all files in the current directory
for file in *; do
  # Check if the file is not a directory
  if [ -f "$file" ]; then
    # Get the file extension
    ext="${file##*.}"
    # Rename the file to "Seasonal [n].ext"
    mv "$file" "Casting [$n].$ext"
    echo "Renamed $file to Seasonal [$n].$ext"
    # Increment the counter
    n=$((n + 1))
  fi
done
