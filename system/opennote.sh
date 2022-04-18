#! /usr/bin/bash

file=$(find ${HOME}/notes -type f | fzf --multi --bind 'ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind 'ctrl-space:+execute:(cat ${HOME}/computing/minimise_lf | awesome-client)' --bind 'ctrl-space:+abort' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

cd "${HOME}"/notes

setsid -f foot -a footws2 nvim "$file"
# setsid -f foot nvim "$file" && exit
swaymsg [app_id="fc"] = kill
