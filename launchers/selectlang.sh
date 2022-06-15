#! /usr/bin/bash

lang=$(echo -e "C\nLua\nNotes\nPython\nRust\nShell" | fzf --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')


case "$lang" in
	*C*) nvim ~/.test/scripts/cprog/test.c ;; 
	*Lua*) nvim ~/.test/scripts/test.lua ;;
	*Notes*) 
		file=$(find ${HOME}/notes -type f | fzf --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')
		[ -z "$file" ] && { exit; }
		nvim "${file}" ;;
	*Python*) nvim ~/.test/scripts/test.py ;;
	*Rust*) nvim ~/.test/scripts/tutorial/src/main.rs ;;
	*Shell*) nvim ~/.test/scripts/test.sh ;;

esac

#[ -z "$file" ] && { exit; }

# lf -remote "send select \"$file\""
#
# cd "${HOME}"/notes
#
# setsid -f foot nvim "$file"
# # setsid -f foot nvim "$file" && exit
# swaymsg [app_id="fc"] = kill
