#!/bin/bash

set -euo pipefail

declare -A wallpaperAndUrl=(
  [winter-forest.1920x1080.mp4]="https://motionbgs.com/dl/hd/75"
)

target_dir="$HOME/.local/share/backgrounds/"
mkdir -p "$target_dir"

cd "$target_dir"

for dest in "${!wallpaperAndUrl[@]}"; do
  url_i=${wallpaperAndUrl[${dest}]}
  wget -q --show-progress "$url_i" -O "$dest"
  echo "url: $url_i" >> "$dest.txt"
done

