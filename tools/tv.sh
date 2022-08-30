#!/usr/bin/env bash

VERSION=0.1

CHANNEL_DIR="/home/`whoami`/.config/tv"

FULL_SCREEN=false

MPV_FLAGS="--no-resume-playback"

play(){
    if [[ -n "$1" ]]; then
        echo "please wait"
        [ "$FULL_SCREEN" = true ] && MPV_FLAGS="$MPV_FLAGS --fs"
        mpv "$1" $MPV_FLAGS
    fi
}

select_channel(){
    name=$(cat channels.json| jq ".[].name" | tr -d '"' | fzf);
    var=".[] | select(.name==\"$name\") | .url"
    command="cat channels.json | jq '$var' "
    as=$(eval $command | tr -d '"' )
    play $as
}

dep_check(){
    deps=(mpv fzf jq wget cat)
    for dep in ${deps[@]};do
        command -v "$dep" 1>/dev/null || missing="$missing $dep"
    done;

    if [[ -n "$missing" ]]; then
        echo "$missing not found, Please install it";
        exit 1
    fi

    mkdir -p "$CHANNEL_DIR"
    cd "$CHANNEL_DIR"

    if [[ ! -f channels.json ]];then 
        echo "Downloading channel list "; 
        wget -q --show-progress https://iptv-org.github.io/iptv/channels.json ||\
            print_error "Cannot download channel list" 
    fi

    select_channel
}

print_error() {
    # Print error message
    #
    # The first argument provided to this function will be the error message.
    # Script will exit after printing the error message.
    printf "%b\n" "Error: $1" >&2
    exit 1
}

usage() {
    # Using 'cat << EOF' we can easily output a multiline text. This is much
    # better than using 'echo' for each line or using '\n' to create a new line.


    cat <<EOF
tv
A command line program to watch tv online.
-f, --full-screen 
        Opens mpv in fullscreen
-h, --help
        Show help
--version
        Show version
EOF
}

version(){
    echo "tv $VERSION"
}

main(){
    [ $# -eq 0 ] && dep_check && exit

    while [ "$1" ]; do
        case "$1" in
            --help | -h) usage && exit ;;
            --version | -v) version && exit ;;
            --full-screen | -f) FULL_SCREEN=true && dep_check;;
            -*) print_error "option '$1' does not exist" ;;
        esac
        shift
    done
}

main "$@"
