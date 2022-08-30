#! /usr/bin/bash

datestring=$(date +%d-%m-%y-%H%M-%S)

path=${HOME}/media/pictures/screenshots/snip"$datestring".jpg

grim -g "$(slurp)" "$path" && wl-copy < "$path"

lf -remote "send select \"$path\""
