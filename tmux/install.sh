#!/bin/bash

conf="$HOME/.tmux.conf"
target=$(readlink -f "${BASH_SOURCE%/*}/config")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

