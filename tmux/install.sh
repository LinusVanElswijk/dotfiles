#!/bin/bash

# Install TPM.
tpm_dest="${TMUX_PLUGIN_MANAGER_PATH}/tpm"
mkdir -p $tpm_dest
rm -rf $tpm_dest
git clone https://github.com/tmux-plugins/tpm \
  $tpm_dest \
  --branch v3.1.0 \
  --single-branch \
  -c advice.detachedHead=false

# Install the config file. 
conf="$HOME/.tmux.conf"
target=$(readlink -f "${CONFIG_SYNC_DIR}/tmux/config")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

