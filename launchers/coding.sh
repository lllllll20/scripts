#! /usr/bin/bash

cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .app_id')"

if [ "$cur_focus" == "mpv" ]; then
    setsid -f foot -a coding ~/computing/git/scripts/launchers/selectlang.sh
else
    clip=$(wl-paste)
    if echo "$clip" | grep youtube; then

        setsid -f mpv "${clip}"

        modspace() {
            change=$(printf "$message" | grep -P -o "change\":.*?,")
            
            case "$change" in
            *new*)
                # current_workspace=$(swaymsg -t get_workspaces | grep -B3 "focused\": true" | grep num | grep -o "[0-9]")	    
                # prev_workspace=$(("$current_workspace" - 1))
                # echo $prev_workspace
                # See if the workspace is empty,
                # You can do this with swaymsg, but it is easlier with lswt
                [ "$(lswt -t | cut -f5 | grep -c true)" -lt 1 ] &&\
                # echo "reached move" && swaymsg workspace back_and_forth
                sleep 0.3
                swaymsg [app_id="mpv"] splitv
            ;;
            esac
        }


        message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
        modspace "$message"
        if yt-dlp -e "$clip" | grep -i "python"; then
	        setsid -f foot -a coding nvim ~/.test/scripts/test.py
        elif yt-dlp -e "$clip" | grep -i "c programming"; then
	        setsid -f foot -a coding nvim ~/.test/scripts/cprog/test.c
        elif yt-dlp -e "$clip" | grep -i "lua"; then
	        setsid -f foot -a coding nvim ~/.test/scripts/lua.py
        elif yt-dlp -e "$clip" | grep -i "rust"; then
	        setsid -f foot -a coding nvim ~/.test/scripts/tutorial/src/main.rs
        else

            setsid -f foot -a coding ~/computing/git/scripts/launchers/selectlang.sh
        fi
    else
        exit
    fi

fi

# setsid -f foot -a coding
# sleep 0.8
# swaymsg [app_id="coding"] splitv
#
# clip=$(wl-paste)
# setsid -f mpv "${clip}"



# command=$(echo -e "Python\nShell" | fzf --multi --bind 'ctrl-space:execute(lf -remote "send select \"$(printf "%s" {})\"")' --bind 'ctrl-space:+execute:(cat ${HOME}/computing/minimise_lf | awesome-client)' --bind 'ctrl-space:+abort' --color='dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874')
#
# [ -z "$file" ] && { exit; }
#
# lf -remote "send select \"$file\""
#
# cd "${HOME}"/notes
#
# setsid -f foot nvim "$file"
# # setsid -f foot nvim "$file" && exit
# swaymsg [app_id="fc"] = kill
