#!/bin/bash

summarize_path() {
  local -r is_in_home=$(
    if [[ $1 == "${HOME}/"* || $1 = $HOME ]]; then
      echo "true"
    else
      echo "false"
    fi
  )

  shorten_path() {
    if [[ "$is_in_home" = true ]]; then
      echo "${1/$HOME/""}"
    else
      echo $1
    fi
  }

  local -r raw_path=$1
  local -r path=$(shorten_path $1)
  local -r component_list=(${path//\// })
  local -r num_components=${#component_list[@]}

  local header=""
  local center=""
  local tail=""
  
  [[ $raw_path == /* ]] && header="/"
  [[ "$is_in_home" = true ]] && header="~/"

  [[ num_components -ge 1 ]] && header+="${component_list[0]}"
  [[ num_components -ge 2 ]] && tail="/${component_list[-1]}${tail}"
  [[ num_components -ge 3 ]] && tail="/${component_list[-2]}${tail}"
  [[ num_components -ge 4 ]] && center+="/..."
  
  echo "${header}${center}${tail}"
}
summarize_path $@
