#! /usr/bin/bash
	
rsync -av --delete ~/.config/ ~/computing/${HOSTNAME}/configfiles/ 
cp ~/.xprofile ~/computing/${HOSTNAME}/home/
cp ~/.Xresources ~/computing/${HOSTNAME}/home/
cp ~/.bashrc ~/computing/${HOSTNAME}/home/
cp ~/.bashaliases ~/computing/${HOSTNAME}/home/
cp ~/.lficons ~/computing/${HOSTNAME}/home/
cp ~/.xinitrc ~/computing/${HOSTNAME}/home/
cp ~/.bash_profile ~/computing/${HOSTNAME}/home/
cp -r ~/.abook ~/computing/${HOSTNAME}/home/	

if [[ ${HOSTNAME} = "desktop" ]]; then
    cp ~/my_docs/Reference/Database/Passwords.kdbx ~/phone_media/Misc/Passwords.kdbx
fi
