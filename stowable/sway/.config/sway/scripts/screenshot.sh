#!/bin/bash
# Usage
# $ ./screenshot.sh area
# $ ./screenshot.sh window
# $ ./screenshot.sh screen
# $ ./screenshot.sh area_copy
# $ ./screenshot.sh window_copy
# $ ./screenshot.sh screen_copy

case $1 in
    area)
        grim -g "$(slurp -d)"
        ;;
    area_copy)
        grim -g "$(slurp -d)" - | wl-copy
        ;;
    window)
        window_floating=`swaymsg -t get_tree | jq -r '.. | (.floating_nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
        window_tiled=`swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
        if [[ ! -z "$window_floating" ]]
        then
            grim -g "$window_floating"
        else
            grim -g "$window_tiled"
        fi
        ;;
    window_copy)
        window_floating=`swaymsg -t get_tree | jq -r '.. | (.floating_nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
        window_tiled=`swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
        if [[ ! -z "$window_floating" ]]
        then
            grim -g "$window_floating" - | wl-copy
        else
            grim -g "$window_tiled" - | wl-copy
        fi
        ;;
    screen)
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
        ;;
    screen_copy)
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy
        ;;
esac
