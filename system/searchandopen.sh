#! /usr/bin/bash

file=$({
find -L ${HOME}/ \( \
    -path "${HOME}/.ACEStream" -o \
    -path "${HOME}/.cache" -o \
    -path "${HOME}/.config/chromium" -o \
    -path "${HOME}/.config/Microsoft" -o \
    -path "${HOME}/.config/GIMP" -o \
    -path "${HOME}/.config/libreoffice" -o \
    -path "${HOME}/.mozilla" -o \
    -path "${HOME}/.thunderbird" -o \
    -path "${HOME}/.Mail" -o \
    -path "${HOME}/media/photos" -o \
    -path "${HOME}/media/sounds" -o \
    -path "${HOME}/my_docs/archiveddocs" -o \
    -path "${HOME}/.archivedmail" -o \
    -path "${HOME}/.local" -o \
    -path "${HOME}/my_docs/Health" -o \
    -path "${HOME}/.cargo" -o \
    -path "${HOME}/.thumbnails" -o \
    -path "${HOME}/.npm" -o \
    -path "${HOME}/.test/envs/*/lib" -o \
    -path "${HOME}/.Private" -o \
    -path "${HOME}/.zoom" \) -prune -o -type f -print

find ${HOME}/.local/share/lf 

}\
    | fzf --multi --bind='ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind='ctrl-space:+execute:(~/.config/sway/scripts/togglefiles.sh)' --bind='ctrl-space:+execute:(swaymsg [app_id="fc"] kill)' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

mymime=$(xdg-mime query filetype "$file")

if [[ "$mymime" = "text/"* ]]; then
        setsid -f emacsclient -r -a emacs "$file" >/dev/null 2>&1
elif [[ "$mymime" = "audio/"* ]]; then
    setsid -f mpv --audio-display=no "$file" --quiet >/dev/null 2>&1 
#elif  [[ "$mymime" = "inode/directory" ]]; then
#    cat ${HOME}/computing/minimise_lf | awesome-client
else
    echo "$file" | sed -e 's/ /\\ /g' | setsid -f xargs -r xdg-open  
fi

# swaymsg [app_id="fc"] kill

# if [[ "$mymime" = "text/"* ]]; then
#     if wlrctl window focus "neovim" == true;
#     then
#         nvim --server /tmp/nvim.pipe --remote "$file" >/dev/null 2>&1
#     else
#         setsid -f foot -a neovim nvim --listen /tmp/nvim.pipe "$file" >/dev/null 2>&1
#     fi
#     #setsid -f foot -a footws2 nvim "$file"
# elif [[ "$mymime" = "audio/"* ]]; then
#     setsid -f mpv --audio-display=no "$file" --quiet >/dev/null 2>&1 
# #elif  [[ "$mymime" = "inode/directory" ]]; then
# #    cat ${HOME}/computing/minimise_lf | awesome-client
# else
#     echo "$file" | sed -e 's/ /\\ /g' | setsid -f xargs -r xdg-open  
# fi
# # swaymsg [app_id="fc"] kill
#
