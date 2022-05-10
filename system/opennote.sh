#! /usr/bin/bash

file=$(find ${HOME}/notes -type f | fzf --multi --bind 'ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind 'ctrl-space:+execute:(cat ${HOME}/computing/minimise_lf | awesome-client)' --bind 'ctrl-space:+abort' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')

[ -z "$file" ] && { exit; }

lf -remote "send select \"$file\""

cd "${HOME}"/notes

if wlrctl window focus "neovim" == true;
then
    nvim --server /tmp/nvim.pipe --remote "$file" >/dev/null 2>&1
else
    setsid -f foot -a neovim nvim --listen /tmp/nvim.pipe "$file" >/dev/null 2>&1
fi
swaymsg [app_id="fc"] = kill
