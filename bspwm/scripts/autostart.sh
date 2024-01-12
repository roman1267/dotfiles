#!/bin/bash

# System
pgrep -x sxhkd > /dev/null || sxhkd &
# pgrep -x picom > /dev/null || picom --experimental-backends --backend glx &
pgrep -x xclip > /dev/null || xclip &
pgrep -x dunst > /dev/null || dunst &
pgrep -x onedrive > /dev/null || onedrive --m --disable-notifications &
# Applications
pgrep -x conky > /dev/null || conky -c /home/romanm/.config/conky/Catppuccin/macchiato.conf &
mkdir /tmp/polybar
touch /tmp/polybar/polybar.log
pgrep -x polybar > /dev/null || polybar -r main > /tmp/polybar/polybar.log &
# must be started after polybar
pgrep -x birdtray > /dev/null || birdtray &
pgrep -x flameshot > /dev/null || flameshot &
pgrep -x nm-applet > /dev/null || nm-applet &
###############################
pgrep -x todoist > /dev/null || flatpak run com.todoist.Todoist &
pgrep -x keepassxc > /dev/null || flatpak run org.keepassxc.KeePassXC &
