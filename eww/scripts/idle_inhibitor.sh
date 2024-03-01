#!/bin/bash

toggle_idle_inhibitor() {
    if eval "$1" &>/dev/null; then
        xset s off -dpms
        dunstify -h string:x-dunst-stack-tag:idle_inhibitor "idle inhibitor enabled"
    else
        xset s on +dpms
        dunstify -h string:x-dunst-stack-tag:idle_inhibitor "idle inhibitor disabled"
    fi
}

is_idle_inhibited() {
    if eval "$1" &>/dev/null; then
        return 1
    else
        return 0
    fi
}

is_inhibited_raw='xset q | rg "DPMS is Enabled"'

case "$1" in
    is_idle_inhibited)
        if is_idle_inhibited "$is_inhibited_raw"; then
            echo "true"
        else
            echo "false"
        fi
        ;;
    *)
        toggle_idle_inhibitor "$is_inhibited_raw"
        ;;
esac
