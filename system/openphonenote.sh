#! /usr/bin/bash

file=$(find "${HOME}"/phone_media/Notes -not -path '*/\.*' -type f | fzf --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

cd "${HOME}"/notes
emacsclient -c -a emacs "$file" >/dev/null 2>&1

# if wlrctl window focus "neovim" == true;
# then
#     nvim --server /tmp/nvim.pipe --remote "$file" >/dev/null 2>&1
# else
#     setsid -f foot -a neovim nvim --listen /tmp/nvim.pipe "$file" >/dev/null 2>&1
# fi
# swaymsg [app_id="fc"] = kill
