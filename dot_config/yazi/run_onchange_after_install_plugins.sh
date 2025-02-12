#!/bin/bash

# Cleanup
if [ -d "$HOME"/.config/yazi/plugin/ ]; then
  rm -rf "$HOME"/.config/yazi/plugin/
fi
mkdir "$HOWE"/.config/yazi/plugins/

# Install
ya pack -a dedukun/relative-motions
ya pack -a lpanebr/yazi-plugins:first-non-directory
ya pack -a Rolv-Apneseth/starship
ya pack -a yazi-rs/plugins:diff
ya pack -a yazi-rs/plugins:full-border
ya pack -a yazi-rs/plugins:jump-to-char
