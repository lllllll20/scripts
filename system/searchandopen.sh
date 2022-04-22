#! /usr/bin/bash

file=$(find -L ${HOME}/ \( -path "${HOME}/.cache" -o -path "${HOME}/.mozilla" -o -path "${HOME}/.thunderbird" -o -path "${HOME}/.Mail" -o -path "${HOME}/media/photos" -o -path "${HOME}/media/sounds" -o -path "${HOME}/my_docs/archiveddocs" -o -path "${HOME}/.archivedmail" -o -path "${HOME}/.local/bin" -o -path "${HOME}/.local/share/webkitgtk" -o -path "${HOME}/.local/share/Trash" -o -path "${HOME}/my_docs/Health" -o -path "${HOME}/.cargo" -o -path "${HOME}/.thumbnails" -o -path "${HOME}/.npm" -o -path "${HOME}/.test/envs/*/lib" -o -path "${HOME}/.Private" -o -path "${HOME}/.zoom" \) -prune -o -type f -print | fzf --multi --bind 'ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind 'ctrl-space:+execute:(cat ${HOME}/computing/minimise_lf | awesome-client)' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

mymime=$(xdg-mime query filetype "$file")

if [[ "$mymime" = "text/"* ]]; then
    setsid -f foot -a footws2 nvim "$file"
elif [[ "$mymime" = "audio/"* ]]; then
    setsid -f mpv --audio-display=no "$file" --quiet >/dev/null 2>&1 
#elif  [[ "$mymime" = "inode/directory" ]]; then
#    cat ${HOME}/computing/minimise_lf | awesome-client
else
    echo "$file" | sed -e 's/ /\\ /g' | setsid -f xargs -r xdg-open  
fi
swaymsg [app_id="fc"] = kill

