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
  wattage=$(echo - | awk "{printf \"%.1f\", \
$(( \
  $(cat /sys/class/power_supply/BAT1/current_now) * \
  $(cat /sys/class/power_supply/BAT1/voltage_now) \
)) / 1000000000000 }" ; echo "W")
  vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  ssid=$(nmcli -t -f name,device connection show --active | sed 's|:| @ |')
  quality=$(nmcli -f IN-USE,SIGNAL device wifi | grep '*' | awk '{print $2}')
  weather=$(cat /tmp/weather.cache)

  echo "$s $weather $s $ssid $quality% $s vol: $vol mute: $muted $s bat: $bat% $s pwr: $wattage $s temp: $temp $s cpu: $cpu_use% $s mem: $mem $s date: $datetime $s"
  sleep 10
done
