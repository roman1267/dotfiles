#!/bin/bash

nodes_added() {
    command ...
}
handle() {
    case "$1" in
        "node_add"*)
            raw_nodes=$(echo "$1" | awk '{$1=""; print $0}') ;
            for raw_node in $raw_nodes; do
                if wmctrl -l | grep -q "${raw_node,,}"; then
                    xprop -id "$raw_node" | grep WM_CLASS
                fi
            done ;;
    esac
}

bspc subscribe all | while read -r line; do handle "$line"; done
