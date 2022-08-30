#! /usr/bin/bash

file=$(find -L ${HOME}/ \( -path "${HOME}/.cache" -o -path "${HOME}/.mozilla" -o -path "${HOME}/.thunderbird" -o -path "${HOME}/.Mail" -o -path "${HOME}/media/photos" -o -path "${HOME}/media/sounds" -o -path "${HOME}/my_docs/archiveddocs" -o -path "${HOME}/.archivedmail" -o -path "${HOME}/.local" -o -path "${HOME}/my_docs/Health" -o -path "${HOME}/.cargo" -o -path "${HOME}/.thumbnails" -o -path "${HOME}/.npm" -o -path "${HOME}/.test/envs/*/lib" -o -path "${HOME}/.Private" -o -path "${HOME}/.zoom" \) -prune -o -type d -print | fzf --multi --bind 'ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind 'ctrl-space:+execute:(cat ${HOME}/computing/minimise_lf | awesome-client)' --bind 'ctrl-space:+abort' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

notify-send "'$file' copied to clipboard."
setsid -f wl-copy "$file"
swaymsg [app_id="fc"] = kill
