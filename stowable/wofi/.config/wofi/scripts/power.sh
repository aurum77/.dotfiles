#!/bin/bash

entries="󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍁 Lock\n󰍃 Logout"

selected=$(echo -e $entries | wofi --show dmenu -i --lines=7 --width=240 --hide-scroll --cache-file=/dev/null --prompt="Power Options" | awk '{print tolower($2)}')

case $selected in
shutdown)
  exec systemctl poweroff -i
  ;;
reboot)
  exec systemctl reboot
  ;;
suspend)
  swaylock -i $HOME/pics/wall.jpg &
  exec systemctl suspend
  ;;
lock)
  exec swaylock -i $HOME/pics/wall.jpg
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
esac
