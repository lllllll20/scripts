#!/bin/sh

chosen=$(cut -d ';' -f1 ${HOME}/computing/data/emoji | fzf --color='dark,bg+:#82AAFF,fg+:#080808,hl:#fc514e,hl+:#ff5874' | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# character. Otherwise, show a message that the emoji has been copied.
notify-send "'$chosen' copied to clipboard."
setsid -f wl-copy "$chosen" 
swaymsg [app_id="fc"] = kill

