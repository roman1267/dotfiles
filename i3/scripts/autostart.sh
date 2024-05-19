#!/bin/bash

# System
# pgrep -x sxhkd > /dev/null || sxhkd &
# pgrep -x picom > /dev/null || picom --backend glx &
pgrep -x xclip &> /dev/null || xclip &
pgrep -x dunst &> /dev/null || dunst &
pgrep -x eww &> /dev/null || eww daemon &

if ! eww active-windows | rg -q "bar"; then
    eww open bar
fi

sleep 2

# Systray applications
pgrep -x flameshot &> /dev/null || flameshot &
pgrep -x blueman-applet &> /dev/null || blueman-applet &
pgrep -x birdtray &> /dev/null || birdtray &
pgrep -x todoist &> /dev/null || com.todoist.Todoist &
pgrep -x keepassxc &> /dev/null || org.keepassxc.KeePassXC &
pgrep -x onedrive &> /dev/null || onedrivegui &
pgrep -x nm-applet &> /dev/null || nm-applet --indicator &
sleep 2
killall nm-applet
pgrep -x nm-applet &> /dev/null || nm-applet --indicator &
pgrep -x xss-lock &> /dev/null || xss-lock --transfer-sleep-lock -- i3lock -f -c 939AB7 --nofork &
# Applications
# pgrep -x conky > /dev/null || conky -c /home/romanm/.config/conky/Catppuccin/macchiato.conf &
# pgrep -x polybar > /dev/null || /home/roman/.config/polybar/scripts/init.sh &
