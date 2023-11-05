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

# Install gitmux

if command -v gitmux &> /dev/null; then
  echo "gitmux is already installed."
else
  # Define the URL for gitmux download
  GITMUX_URL="https://github.com/arl/gitmux/releases/download/v0.10.3/gitmux_v0.10.3_linux_amd64.tar.gz"
  GITMUX_TMP_DIR="/tmp/gitmux_install_$(date +%s)"
  
  mkdir -p "$GITMUX_TMP_DIR"  
  ( cd "$GITMUX_TMP_DIR" 
    wget "$GITMUX_URL" -O gitmux.tar.gz
    tar -xzf gitmux.tar.gz
    chmod +x gitmux
    mv gitmux ~/bin/
  )
  rm -rf "$GITMUX_TMP_DIR"
  
  echo "gitmux has been installed in ~/bin."
fi

# Install the config file. 
conf="$HOME/.tmux.conf"
target=$(readlink -f "${CONFIG_SYNC_DIR}/tmux/config")
echo "Replacing '$conf' with a link to '$target'."
rm -f $conf
ln -s $target $conf 

