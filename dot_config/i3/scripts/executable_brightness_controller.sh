#!/bin/bash 

INITIAL_BRIGHTNESS="$(( $(brightnessctl get) * 100 / $(brightnessctl max) ))"
BRIGHTNESS_STOPS=(1 2 5 10 15 20 30 40 50 60 70 80 90 100)

set_brightness() {
  local brightness=$1
  brightnessctl set "${brightness}%"
  notify-send --urgency low --expire-time 1000 "Brightness ${brightness}%"
}

next_stop() {
  local value=$1
  local direction=$2

  if [[ $direction == "up" ]]; then
    for num in "${BRIGHTNESS_STOPS[@]}"; do
      if (( num > value )); then
        echo "$num"
        return
      fi
    done
    echo 100
    return
  elif [[ $direction == "down" ]]; then
    for (( i=${#BRIGHTNESS_STOPS[@]}-1; i>=0; i-- )); do
      num=${BRIGHTNESS_STOPS[i]}
      if (( num < value )); then
        echo "$num"
        return
      fi
    done
    echo 0
    return
  else
    echo "Invalid direction. Use 'up' or 'down'."
    exit 1
  fi
}

case "$1" in 
    up)
    {
      set_brightness "$(next_stop ${INITIAL_BRIGHTNESS} up)"
      exit
    };;
    down)
    {
      set_brightness "$(next_stop ${INITIAL_BRIGHTNESS} down)"
      exit
    };;
    *)
    {
      echo "'${1}' is not a valid option. Valid optinos: 'up', 'down'"
      exit 1
    };;
esac;
