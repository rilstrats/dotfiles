#!/bin/bash

# WALLPAPER="$HOME/.wallpapers/christ-fishermen"
WALLPAPER="$XDG_CONFIG_HOME/wallpapers/lost-between"
# WALLPAPER="$HOME/.wallpapers/tokyo-night"

if [[ ! -z $(xrandr | grep "eDP-1 connected") ]]; then
  i3lock -i $WALLPAPER.3240x2160.png

elif [[ ! -z $(xrandr | grep "HDMI-0 connected") && ! -z $(xrandr | grep "DP-4 connected") ]]; then
  i3lock-fancy
fi

