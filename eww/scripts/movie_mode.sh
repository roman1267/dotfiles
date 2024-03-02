#!/bin/bash

toggle_movie_mode() {
    if eval "$1" &>/dev/null; then
        # dunstify -h string:x-dunst-stack-tag:idle_inhibitor "movie mode enabled"
        xset s off -dpms
        dunstctl set-paused true
    else
        xset s on +dpms
        dunstify -h string:x-dunst-stack-tag:idle_inhibitor "movie mode disabled"
        dunstctl set-paused false
    fi
}

is_movie_mode() {
    if eval "$1" &>/dev/null && eval "$2" &>/dev/null; then
        return 1
    else
        return 0
    fi
}

is_dpms_enabled='xset q | rg "DPMS is Enabled"'
is_dunst_enabled='dunstctl is-paused | rg false'

case "$1" in
    is_movie_mode)
        if is_movie_mode "$is_dpms_enabled" "$is_dunst_enabled"; then
            echo true
        else
            echo false
        fi
        ;;
    toggle)
        toggle_movie_mode "$is_dpms_enabled" "$is_dunst_enabled"
        ;;
esac
