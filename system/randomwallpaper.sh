#! /usr/bin/bash

mywallpaper=$(find ~/computing/wallpapers/ -type f -printf "%f\n" | shuf -n 1)


sed -i "/set \$background /c\set \$background ~/computing/wallpapers/\"$mywallpaper\"" ~/.config/sway/config
sed -i "/swaylock/c\swaylock -u -i ~/computing/wallpapers/\"$mywallpaper\"" ~/.config/sway/scripts/lockscreen.sh

