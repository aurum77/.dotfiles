#!/usr/bin/env bash

op=$( echo -e " Poweroff\n   Reboot\n Suspend\n Lock\n Logout" | wofi --insensitive --show=dmenu --width=25% | awk '{print tolower($2)}' )

case $op in
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		        swaylock -i ~/Pictures/wall-blur.png
                ;;
        logout)
                swaymsg exit
                ;;
esac
