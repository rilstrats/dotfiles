#!/bin/bash

# WALLPAPER="$HOME/.config/wallpapers/christ-fishermen"
WALLPAPER="$HOME/.config/wallpapers/lost-between"
# WALLPAPER="$HOME/.config/wallpapers/tokyo-night"

if [[ ! -z $(xrandr | grep "eDP-1 connected") ]]; then
  i3lock -i $WALLPAPER.3240x2160.png

elif [[ ! -z $(xrandr | grep "HDMI-0 connected") && ! -z $(xrandr | grep "DP-4 connected") ]]; then
  i3lock-fancy
fi

