#!/usr/bin/bash

get_executable() {

 IFS=:
 for path in $PATH
 do
     IFS=
    for file in "$path"/*
    do
        basename "$file"
    done
     IFS=:
 done
 unset IFS
}

prog="$(get_executable | fzf)"

[ -z "$prog" ] && { exit; }

setsid -f "$prog"
