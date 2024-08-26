#!/bin/bash

# if tmux list-panes -s -F '#{pane_input_off}' | grep -q 1; then
#     tmux select-pane -e
# fi
session_name=$(tmux display-message -p '#S')
pane_list=$(tmux list-panes -s -F '#{window_index}.#{pane_index}' | tr -d '$@%')

case $1 in
off)
    for pane in ${pane_list}; do
        tmux select-pane -t $session_name:$pane -d
    done
    ;;
*)
    for pane in ${pane_list}; do
        tmux select-pane -t $session_name:$pane -e
    done
    ;;
esac
