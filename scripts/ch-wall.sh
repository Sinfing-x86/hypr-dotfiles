#!/bin/bash

wallpaper=$(find "$HOME/Wallpapers" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.webp' \) | shuf -n 1)
swww img $wallpaper --transition-type center --transition-step 255 --transition-fps 60
