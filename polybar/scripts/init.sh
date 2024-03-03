#!/bin/bash

#########################
# Before polybar starts #
#########################

# make the directory for named pipes to live in
mkdir -p /tmp/user-fifo/

# onedrive_activity pipe
mkfifo /tmp/user-fifo/onedrive_activity.fifo 2> /dev/null

####################
# Starting Polybar #
####################

polybar -r -c /home/roman/.config/polybar/gruvbox-dark-config.ini systray &

#########################
# After polybar starts #
#########################

pgrep -x birdtray > /dev/null || birdtray &
pgrep -x flameshot > /dev/null || flameshot &
pgrep -x nm-applet > /dev/null || nm-applet &
pgrep -x blueman-applet > /dev/null || blueman-applet &
pgrep -x todoist > /dev/null || com.todoist.Todoist &
pgrep -x keepassxc > /dev/null || org.keepassxc.KeePassXC &
