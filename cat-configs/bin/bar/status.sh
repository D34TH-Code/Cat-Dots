#!/bin/sh

bar="cat-configs"
bar_pid=$(pgrep -a "polybar" | grep "$bar" | cut -d" " -f1)
players="spotify,%any,firefox,chromium,brave,mpd"
player_status=$(playerctl -p $players status)
script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
exit=$?

update_hooks () {
    while IFS= read -r id; do
      polybar-msg -p "$id" hook music-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

scroll () {
    zscroll -l 20 \
            --delay 1 \
            --scroll-padding " | " \
            --match-command "$script_dir/status.sh scroll-music" \
            --match-text "Playing" "--scroll 1" \
            --match-text "Paused" "--scroll 0" \
            --match-text "No players found" "--scroll 0" \
            --update-check true "$script_dir/status.sh" &
    wait
}

if [ $exit -eq 0 ]; then
    status=$player_status
else
    status="Offline"
fi

if [[ "$1" == "scroll-music" ]]; then
    echo $player_status
else
    if [ "$player_status" == "Stopped" ]; then
        echo "Offline"
    elif [ "$player_status" == "Paused"  ]; then
        update_hooks "48593" 2
        playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
    elif [ "$player_status" == "Offline"  ]; then
        echo $player_status
    else
        update_hooks "48593" 1
        playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
    fi
fi


case $1 in
    scroll-toggle)
        scroll
    ;;
    next)
        playerctl -p $players next
    ;;
	previous)
        playerctl -p $players previous
    ;;
	toggle)
        playerctl -p $players play-pause
    ;;
esac
