#!/bin/bash

tmux_trim_string () {
  local path=$1

  if [[ ${#path} -gt 24 ]] ; then
    echo "...${path: -21}"
  else
    echo $path
  fi
}
tmux_trim_string $@

