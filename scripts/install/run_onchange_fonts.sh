#!/bin/bash

set -euo pipefail

font_archive_sources=(
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.tar.xz"
)
font_singular_sources=(
  "https://github.com/kaBeech/serious-shanns/releases/download/v6.0.0/SeriousShanns-Regular.otf"
  "https://github.com/kaBeech/serious-shanns/releases/download/v6.0.0/SeriousShanns-Italic.otf"
)

target_dir="$HOME/.fonts/"
mkdir -p $target_dir

tempdir="$(mktemp -d /tmp/dl_fonts_XXXXXXXX)"
cd "$tempdir"
echo "Using $tempdir for temp data"

for source in "${font_archive_sources[@]}"; do
  echo "Downloading $source..."
  wget -q --show-progress "$source" -O archive.tar.xz
  tar -xf archive.tar.xz
done
rm archive.tar.xz

for source in "${font_singular_sources[@]}"; do
  echo "Downloading $source..."
  wget -q --show-progress "$source"
done

mv -nv *.ttf "$target_dir"
mv -nv *.otf "$target_dir"

cd ..
rm -rf "$tempdir"
