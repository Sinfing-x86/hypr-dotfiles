#!/bin/bash

# Get all image files with full paths
wallpapers=$(find "$HOME/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

# Pass only filenames to rofi
selected=$(echo "$wallpapers" | xargs -I{} basename "{}" | rofi -dmenu -p "Wallpaper")

# Match selection back to full path
wallpaper=$(echo "$wallpapers" | grep "/$selected$")

# If a match is found, set the wallpaper
if [[ -n "$wallpaper" ]]; then
    swww img "$wallpaper" --transition-type wipe --transition-angle 30 --transition-step 255 --transition-fps 60
fi
