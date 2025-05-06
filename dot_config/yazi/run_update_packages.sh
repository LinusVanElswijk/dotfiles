#!/bin/sh

pluginDir="$HOME/.config/yazi/plugins/"
if [ -d "$pluginDir" ]; then
  rm -rf "$pluginDir"
fi

flavorDir="$HOME/.config/yazi/flavors/"
if [ -d "$flavorDir" ]; then
  rm -rf "$flavorDir"
fi

packageFile="$HOME/.config/yazi/package.toml"
if [ -f "$packageFile" ]; then
  rm -f -- "$HOME/.config/yazi/package.toml"
fi

ya pack -a yazi-rs/flavors:catppuccin-mocha
ya pack -a yazi-rs/flavors:catppuccin-latte

ya pack -a dedukun/relative-motions
ya pack -a lpanebr/yazi-plugins:first-non-directory
ya pack -a Rolv-Apneseth/starship
ya pack -a yazi-rs/plugins:diff
ya pack -a yazi-rs/plugins:jump-to-char
ya pack -a yazi-rs/plugins:mount

