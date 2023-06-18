#! /usr/bin/bash


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
