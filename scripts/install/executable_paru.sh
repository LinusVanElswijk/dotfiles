#!/bin/bash

set -euo pipefail

sudo pacman -S --needed base-devel
mkdir -p ~/git
cd ~/git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
