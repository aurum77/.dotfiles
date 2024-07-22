#!/bin/bash
# Usage
# $ ./sound.sh up
# $ ./sound.sh down
# $ ./sound.sh mute

soundlimit=150

function get_volume {
  pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'
}

function get_muted {
  pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

function get_volume_level {
  volume=$(get_volume)
  echo ${volume%\%}
}

function exit_if_muted {
  if [[ $(get_muted) == 'yes' ]]; then
    exit
  fi
}

case $1 in
up)
  exit_if_muted
  if [[ $(get_volume_level) -lt $soundlimit ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +2%
  fi
  ;;
down)
  exit_if_muted
  pactl set-sink-volume @DEFAULT_SINK@ -2%
  ;;
mute)
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
esac
