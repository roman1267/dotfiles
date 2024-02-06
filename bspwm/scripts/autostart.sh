#!/bin/bash

# System
pgrep -x sxhkd > /dev/null || sxhkd &
pgrep -x picom > /dev/null || picom --backend glx &
pgrep -x xclip > /dev/null || xclip &
pgrep -x dunst > /dev/null || dunst &
pgrep -x onedrivegui > /dev/null || onedrivegui &
# Applications
# pgrep -x conky > /dev/null || conky -c /home/romanm/.config/conky/Catppuccin/macchiato.conf &
pgrep -x polybar > /dev/null || polybar -r -c /home/roman/.config/polybar/gruvbox-dark-config.ini main &
# must be started after polybar
pgrep -x birdtray > /dev/null || birdtray &
pgrep -x flameshot > /dev/null || flameshot &
pgrep -x nm-applet > /dev/null || nm-applet &
pgrep -x blueman-applet > /dev/null || blueman-applet &
pgrep -x todoist > /dev/null || com.todoist.Todoist &
pgrep -x keepassxc > /dev/null || org.keepassxc.KeePassXC &

###############################
pgrep -x xss-lock > /dev/null || xss-lock --transfer-sleep-lock -- i3lock -f -c 939AB7 --nofork &
