#!/bin/bash

# You can call this script like this:
# $ ./brightness.sh up
# $ ./brightness.sh down

notify_id=817

function send_notification {
  brightnow=$(brightnessctl get)
  brightmax=$(brightnessctl max)

  brightpercent=$(awk "BEGIN {printf ${brightnow}/${brightmax}*100}" | cut -d. -f1)

  dunstify -r $notify_id -u low \
    -h int:value:"$brightpercent" "brightness:${brightpercent}%"
}

case $1 in
  up)
    # increase the backlight by 2%
    brightnessctl set +2%
    send_notification
    ;;
  down)
    # decrease the backlight by 2%
    brightnessctl set 2%-
    send_notification
    ;;
esac
