#!/bin/bash

conf="$HOME/.vimrc"
target=$(readlink -f "${CONFIG_SYNC_DIR}/vim/vimrc")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

