#!/bin/bash

entries="shutdown\nreboot\nsuspend\nlock\nlogout"

selected=$(echo -e $entries | wmenu -f "Noto Sans Mono 13" -b -i -p "power:" -N 282828 -N 282828 -n FBF1C7 -M 458588 -m 282828 -S 458588 -s 282828 | awk '{print tolower($1)}')

case $selected in
shutdown)
  exec systemctl poweroff -i
  ;;
reboot)
  exec systemctl reboot
  ;;
suspend)
  swaylock -i $HOME/pics/wall.jpg &
  sleep 2 &&
  exec systemctl suspend
  ;;
lock)
  exec swaylock -i $HOME/pics/wall.jpg
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
esac
