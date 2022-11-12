#!/bin/bash

# WALLPAPER="$HOME/.wallpapers/christ-fishermen"
WALLPAPER="$HOME/.wallpapers/lost-between"
# WALLPAPER="$HOME/.wallpapers/tokyo-night"

if [[ ! -z $(xrandr | grep "eDP-1 connected") ]]; then
  feh --no-fehb \
    --bg-center "$WALLPAPER/.3240x2160.jpg"

elif [[ ! -z $(xrandr | grep "HDMI-0 connected") && ! -z $(xrandr | grep "DP-4 connected") ]]; then
  feh --no-fehb \
    --bg-center "$WALLPAPER.2560x1080.jpg" \
    --bg-center "$WALLPAPER.1920x1080.jpg"
fi

