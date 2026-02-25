#!/bin/bash

set -euo pipefail

expected_checksum="6cd5d3e5b43ef3c81932d79a1a67a19bb1077222c1bb5505fd83b2c671bbba78"
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
