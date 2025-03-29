#!/bin/bash
# Usage
# $ ./screenshot.sh area
# $ ./screenshot.sh window
# $ ./screenshot.sh screen
# $ ./screenshot.sh area_copy
# $ ./screenshot.sh window_copy
# $ ./screenshot.sh screen_copy

path=$(echo "$HOME/pics/screenshots/$(date +%Y%m%d_%Hh%Mm%Ss).png")

case $1 in
area)
  pkill slurp
  grim -g "$(slurp -b 282828aa -c ebdbb2ff -d -F 'Noto Sans Mono')" "$path"
  ;;
area_copy)
  pkill slurp
  grim -g "$(slurp -b 282828aa -c ebdbb2ff -d -F 'Noto Sans Mono')" - | wl-copy
  ;;
window)
  window_floating=$(swaymsg -t get_tree | jq -r '.. | (.floating_nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
  window_tiled=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
  if [[ ! -z "$window_floating" ]]; then
    grim -g "$window_floating" "$path"
  else
    grim -g "$window_tiled" "$path"
  fi
  ;;
window_copy)
  window_floating=$(swaymsg -t get_tree | jq -r '.. | (.floating_nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
  window_tiled=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
  if [[ ! -z "$window_floating" ]]; then
    grim -g "$window_floating" - | wl-copy
  else
    grim -g "$window_tiled" - | wl-copy
  fi
  ;;
screen)
  grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') "$path"
  ;;
screen_copy)
  grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy
  ;;
esac
