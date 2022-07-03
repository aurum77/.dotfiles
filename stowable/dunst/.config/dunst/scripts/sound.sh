#!/bin/bash
# You can call this script like this:
# $ ./sound.sh up
# $ ./sound.sh down
# $ ./sound.sh mute

notify_id=818

soundlimit=125

function get_volume {
  pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'
}

function get_muted {
  pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

function get_volume_level {
  volume=`get_volume`
  echo ${volume%\%}
}

function volume_notification {
  volume=`get_volume_level`
  dunstify -r $notify_id -u low \
    -h int:value:"$volume" "volume:${volume}%"
}

function mute_notification {
  muted=`get_muted`
  if [[ $muted == 'yes' ]];
  then
    dunstify -r $notify_id -u low \
      "volume:muted"
  else
    dunstify -r $notify_id -u low \
      "volume:unmuted"
  fi
}

function exit_if_muted {
  if [[ $(get_muted) == 'yes' ]]; then
    mute_notification
    exit
  fi
}

case $1 in
  up)
    exit_if_muted
    if [[ $(get_volume_level) -lt $soundlimit ]]; then
      pactl set-sink-volume @DEFAULT_SINK@ +2%
    fi
    volume_notification
    ;;
  down)
    exit_if_muted
    pactl set-sink-volume @DEFAULT_SINK@ -2%
    volume_notification
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    mute_notification
    ;;
esac
