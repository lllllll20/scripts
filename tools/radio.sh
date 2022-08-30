#!/usr/bin/env bash
# A little script to choose and play diffenent radio stations
# Currently uses mpv to play the them
# On first run it will download a list of radio stations
# To update them run radio -u
# REQUIRES:
# * fzf
# * mpv
# * hq

# Change this if you want the radio stations to be saved somewhere else
LIST="${HOME}/computing/data/radioStations"
# Change this if you don't want to use mpv
PLAY="setsid -f mpv --audio-display=no -quiet --input-ipc-server=/tmp/mpvsocket >/dev/null 2&1"

function getRadioStations(){
	echo "Updating radio stations"
	curl -s http://www.radiofeeds.co.uk/pda/search.asp\?search\=+ |\
		hq p data |\
		grep 'href=' |\
		sed -e 's/<\/\?font[^>]*>//g' |\
		while read line; do
			name="$(echo $line | hq b text | head -n 1)"
			echo "$(echo $line | hq a data)" | while read stream; do
				url="$(echo $stream | hq a attr href)"
				quality="$(echo $stream | hq a text)"
				echo "$name	$quality	$url"
			done
		done > "$LIST"
}

function playStation(){
	if [ ! -e "$LIST" ]; then
		getRadioStations
	fi
    echo -e "Name\tQuality\tURL" | cat - "$LIST" | fzf --header-lines=1 --delimiter="\t" --with-nth=1,2 --tabstop=30 --preview="echo {3}" --preview-window=top:1 | cut -d'	' -f3 | xargs -r $PLAY >/dev/null 
}


if [ -n "$1" ]; then
	while [ -n "$1" ]; do
		case "$1" in
			"-u"|"--update")
				getRadioStations
				exit
				;;
			*)
				playStation
		esac
	done
else
	playStation
fi
