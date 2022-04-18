#! /usr/bin/bash

selectandcopy() {

	while true; do

		newconfig=$(find ${HOME}/computing/$1/configfiles/ ${HOME}/computing/$1/home/ -type f | fzf --color="dark,bg+:#b2ceee,fg+:#080808,hl:#fc514e,hl+:#ff5874" --prompt='File to copy> ')

		[ -z "$newconfig" ] && { exit; }

		if [[ "$newconfig" == "${HOME}/computing/$1/configfiles"* ]]; then
			fileandfolder=$(echo $newconfig | sed "s|${HOME}/computing/$1/configfiles/||")
			oldconfig=${HOME}/.config/$fileandfolder
		else
			filename=$(basename $newconfig)
			oldconfig=${HOME}/$filename
		fi

		[ -z "$oldconfig" ] && { exit; }

		cp $newconfig $oldconfig

		IFS=

		read -n1 -s -r -p $'Press enter to continue...\n' key

		if [ "$key" != '' ]; then
			break
		#else
		#    break
		fi
	done

}

if [[ ${HOSTNAME} = "desktop" ]]; then
	selectandcopy laptop

elif [[ ${HOSTNAME} = "laptop" ]]; then
	selectandcopy desktop
fi
