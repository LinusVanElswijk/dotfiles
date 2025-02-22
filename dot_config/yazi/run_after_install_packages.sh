#!/bin/bash

pluginDir="$HOME/.config/yazi/plugins/"
if [ -d "$pluginDir" ]; then
  rm -rf "$pluginDir"
fi

flavorDir="$HOME/.config/yazi/flavors/"
if [ -d "$flavorDir" ]; then
  rm -rf "$flavorDir"
fi

ya pack -i
