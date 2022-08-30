#! /usr/bin/bash

file=$(echo "$1")

cd ~/downloads &&

if [ ${file: -4} == ".mp3" ]; then
    notify-send "No action" "File is mp3" 
else
    wl-copy "$file"
    notify-send "Copied url to clipboard:" "${1}" 
fi
