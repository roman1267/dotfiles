#!/bin/bash

# System
pgrep -x sxhkd > /dev/null || sxhkd &
# pgrep -x picom > /dev/null || picom --backend glx &
pgrep -x xclip > /dev/null || xclip &
pgrep -x dunst > /dev/null || dunst &
pgrep -x onedrive > /dev/null || onedrivegui &
# Applications
# pgrep -x conky > /dev/null || conky -c /home/romanm/.config/conky/Catppuccin/macchiato.conf &
pgrep -x polybar > /dev/null || /home/roman/.config/polybar/scripts/init.sh &

###############################
pgrep -x xss-lock > /dev/null || xss-lock --transfer-sleep-lock -- i3lock -f -c 939AB7 --nofork &
