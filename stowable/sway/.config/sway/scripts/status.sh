#!/bin/sh

s='|'

while true
do
  datetime=$(LANG=tr_TR.UTF-8 date '+%d %B %A | %H:%M')
  mem=$(free -h | grep "Mem" | awk '{print $3}')
  cpu_idle=$(top -b -n 1 | grep Cpu | awk -F ',' '{print $4}'| cut -f 1 -d ".")
  cpu_use=$(expr 100 - $cpu_idle)
  temp=$(cat /sys/class/thermal/thermal_zone*/temp | sed 's/\(.\)..$/°C/')
  bat=$(cat /sys/class/power_supply/BAT*/capacity)
  vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
  mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  ssid=$(nmcli -t -f name connection show --active | head -n 1)
  ssid=${ssid:-'no connection'}
  quality=$(nmcli -f IN-USE,SIGNAL device wifi | grep '*' | awk '{print $2}')
  media=$(playerctl metadata --format "{{trunc(title, 40)}}" 2> /dev/null | sed 's/|/:/')
  media=${media:-'no media'}
  backlight=$(brightnessctl info | grep 'Current' | awk '{print $4}' | sed 's/(//; s/)//')

  echo "$s $media $s $ssid $quality% $s vol: $vol mute: $mute $s bat: $bat% $s light: $backlight $s temp: $temp $s cpu: $cpu_use% $s mem: $mem $s $datetime $s"
  sleep 2
done
