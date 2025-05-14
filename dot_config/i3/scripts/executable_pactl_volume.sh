#!/bin/bash 

INITIAL_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oE '[0-9]+%' | head -n1 | tr -d '%')
VOLUME_STOPS=(0 5 10 15 20 25 30 35 40 50 60 70 80 90 100)
MUTE_STATE=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d' ' -f2)

set_volume() {
  local volume=$1
  pactl set-sink-volume @DEFAULT_SINK@ "${volume}%"
  notify-send --urgency low --expire-time 1000 "Volume ${volume}%"
}

next_stop() {
  local value=$1
  local direction=$2

  if [[ $direction == "up" ]]; then
    for num in "${VOLUME_STOPS[@]}"; do
      if (( num > value )); then
        echo "$num"
        return
      fi
    done
    echo 100
    return
  elif [[ $direction == "down" ]]; then
    for (( i=${#VOLUME_STOPS[@]}-1; i>=0; i-- )); do
      num=${VOLUME_STOPS[i]}
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

case "$1-$MUTE_STATE" in 
    up-yes)
    { 
      pactl set-sink-mute @DEFAULT_SINK@ 0
      set_volume "$(next_stop ${VOLUME_STOPS[0]} up)"
      exit
    };;
    down-yes)
    {
      exit
    };;
    up-no)
    {
      set_volume "$(next_stop ${INITIAL_VOLUME} up)"
      exit
    };;
    down-no)
    {
      set_volume "$(next_stop ${INITIAL_VOLUME} down)"
      exit
    };;
    *)
    {
      echo "'${1}' is not a valid option. Valid optins: 'up', 'down'"
      exit 1
    };;
esac;
