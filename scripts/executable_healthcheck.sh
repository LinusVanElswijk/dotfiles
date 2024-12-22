#!/bin/bash

declare -A command_descriptions=(
  [arandr]=""
  [autorandr]=""
  [bat]="better cat"
  [chezmoi]=""
  [curl]=""
  [delta]="A syntax-highlighting pager for git, diff, grep, and blame output"
  [docker]=""
  [fdfind]="better find"
  [feh]="used for desktop background images"
  [fish]="user-friendly command line shell"
  [fzf]="fuzzy finder"
  [git]=""
  [jumpapp]="switch or open app"
  [kitty]="terminal emulator"
  [node]=""
  [nvim]="neovim"
  [picom]="compositor for the X Window  System"
  [polybar]="status bar"
  [python3]=""
  [rg]="ripgrep, a better grep command"
  [rofi]="window switcher, application launcher and dmenu replacement"
  [wget]=""
  [xwinwrap]="used for desktop background videos"
  [xrandr]=""
  [zoxide]=""
)

declare -A env_var_descriptions=(
  [EDITOR]="preferred text editor"
  [SHELL]="current shell"
  [TERMINAL]="preferred terminal emulator"
  [VISUAL]="preferred text editor"
)

declare -A path_descriptions=(
  ["$HOME/bin"]="user script dir"
  ["$HOME/scripts"]="user script dir"
)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
DEFAULT_COLOR='\033[0m' # No Color

echo -e "\nSystem Health Check\n===================="

# Return length of the longest string 
max_string_length() {
  local max=0
  for str in "$@"; do
    if [ ${#str} -gt "$max" ]; then
      max=${#str}
    fi
  done
  echo "$max"
}

echo -e "\nChecking available commands:"
max_cmd_length=$(max_string_length "${!command_descriptions}")
for cmd in "${!command_descriptions[@]}"; do
  padded_cmd=$(printf "%-${max_cmd_length}s" "$cmd")
  if which "$cmd" &>/dev/null; then
    path=$(which "$cmd")
    echo -e "${GREEN}✔ Found${DEFAULT_COLOR}: $padded_cmd -> $path"
  else
    echo -e "${RED}✘ Not Found${DEFAULT_COLOR}: $padded_cmd  # ${command_descriptions[$cmd]}"
  fi
done

echo -e "\nChecking environment variables:"
max_var_length=$(max_string_length "${!env_var_descriptions}")
for var in "${!env_var_descriptions[@]}"; do
    padded_var=$(printf "%-${max_var_length}s" "$var")
    if [ -n "${!var}" ]; then
        value="${!var}"
        echo -e "${GREEN}✔ Set${DEFAULT_COLOR}  : $padded_var -> $value"
    else
        echo -e "${RED}✘ Not Set${DEFAULT_COLOR}: $padded_var"
    fi
done

echo -e "\nChecking paths in PATH:"
max_path_length=$(max_string_length "${!path_descriptions}")
for path in "${!path_descriptions[@]}"; do
    padded_path=$(printf "%-${max_path_length}s" "$path")
    if echo "$PATH" | grep -qE "(^|:)$path(:|$)"; then
        echo -e "${GREEN}✔ Present${DEFAULT_COLOR}: $padded_path"
    else
        echo -e "${RED}✘ Missing${DEFAULT_COLOR}: $padded_path"
    fi
done

