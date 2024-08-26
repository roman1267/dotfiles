#!/bin/bash

tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf

case "$1" in
pane)
	tmux kill-pane
	;;
window)
	tmux kill-window
	;;
esac
