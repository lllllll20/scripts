#! /usr/bin/bash

datestring=$(date +%d-%m-%y-%H%M-%S)

path=${HOME}/media/pictures/screenshots/screen"$datestring".jpg

if [[ ${HOSTNAME} = "desktop" ]]; then
    grim -o HDMI-A-2 "$path" && wl-copy < "$path"
elif [[ ${HOSTNAME} = "laptop" ]]; then
    grim -o eDP-1 "$path" && wl-copy < "$path"
fi

lf -remote "send select \"$path\""
