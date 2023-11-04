#!/bin/bash

conf="$HOME/.tmux.conf"
target=$(readlink -f "${CONFIG_SYNC_DIR}/tmux/config")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

