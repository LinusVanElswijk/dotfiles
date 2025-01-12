#!/bin/bash

set -euo pipefail

expected_checksum="d71885b58a6f2960842c4d10455b840685528bcef4921b207194a92ff2a32a01"
remote_script=$(wget -qO- https://git.io/papirus-icon-theme-install)
calculated_checksum=$(echo "$remote_script" | sha256sum | awk '{print $1}')

if [ "$calculated_checksum" != "$expected_checksum" ]; then
  echo "Checksum verification failed."
  echo "Expected: $expected_checksum"
  echo "Actual  : $calculated_checksum"
  echo "Aborting."
  exit 1
fi

echo "$remote_script" | env DESTDIR="$HOME/.icons" sh
