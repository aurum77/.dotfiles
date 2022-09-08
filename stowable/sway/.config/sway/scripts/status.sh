#!/bin/sh

s='|'

while true
do
  datetime=$(LANG=tr_TR.UTF-8 date '+%d/%m/%y, %A | %H:%M')
  mem=$(free -h | grep "Mem" | awk '{print $3}')
  cpu_idle=$(top -b -n 1 | grep Cpu | awk '{print $8}'| cut -f 1 -d ".")
  cpu_use=$(expr 100 - $cpu_idle)
  temp=$(cat /sys/class/thermal/thermal_zone*/temp | sed 's/\(.\)..$/°C/')
  bat=$(cat /sys/class/power_supply/BAT*/capacity)
  pwr=$(echo - | awk "{printf \"%.1f\", \
$(( \
  $(cat /sys/class/power_supply/BAT1/current_now) * \
  $(cat /sys/class/power_supply/BAT1/voltage_now) \
)) / 1000000000000 }" ; echo "W")
  vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
  mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  ssid=$(nmcli -t -f name,device connection show --active | sed 's|:| @ |')
  ssid=${ssid:-'no connection'}
  quality=$(nmcli -f IN-USE,SIGNAL device wifi | grep '*' | awk '{print $2}')
  media=$(playerctl metadata --format "{{trunc(title, 45)}}" 2> /dev/null | sed 's/|/:/')
  media=${media:-'no media'}
  up=$(uptime -p | awk '{print $2" "$3}' | cut -f 1 -d ",")
  backlight=$(brightnessctl info | grep 'Current' | awk '{print $4}' | sed 's/(//; s/)//')

  echo "$s $media $s $ssid $quality% $s vol: $vol mute: $mute $s bat: $bat% $s up: $up $s light: $backlight $s pwr: $pwr $s temp: $temp $s cpu: $cpu_use% $s mem: $mem $s date: $datetime $s"
  sleep 10
done
