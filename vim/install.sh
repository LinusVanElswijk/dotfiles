#!/bin/bash

conf="$HOME/.vimrc"
target=$(readlink -f "${BASH_SOURCE%/*}/vimrc")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

