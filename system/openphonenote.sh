#! /usr/bin/bash

file=$(find "${HOME}"/phone_media/Notes -not -path '*/\.*' -type f | fzf --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

cd "${HOME}"/notes

setsid -f foot nvim "$file"
swaymsg [app_id="fc"] = kill
