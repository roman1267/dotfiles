#!/bin/bash

#########################################
# SYSTEM-WIDE, NOT JUST IN THE TERMINAL #
#########################################

# FIXME: Possibly hacky and should be somewhere out of user's reach, probably
ulimit -u 1000

# add cargo bin to PATH
export PATH=$PATH:/home/roman/.cargo/bin

# add polybar scripts to path
XDG_CONFIG_HOME="/home/$(whoami)/.config"
export XDG_CONFIG_HOME
export PATH="$PATH":"$XDG_CONFIG_HOME/polybar/scripts/"

# make default editor Neovim
export EDITOR=nvim

# Locale settings
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


#Java blank screens fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Use kvantum theming for QT applications
export QT_STYLE_OVERRIDE=kvantum

# set default shell and terminal
export SHELL=/usr/bin/fish
export TERMINAL_COMMAND=/usr/bin/foot

# add default location for zeit.db
export ZEIT_DB="$HOME/config/zeit.db"

# crontab-ui env vars
export CRON_DB_PATH=/var/log/crontab-ui/

# Setting XDG vars
export XDG_CONFIG_HOME=/home/roman/.config/
# Disable hardware cursors. This might fix issues with
# disappearing cursors
if systemd-detect-virt -q; then
    # if the system is running inside a virtual machine, disable hardware cursors
    export WLR_NO_HARDWARE_CURSORS=1
fi

set -a
. "$HOME/.config/user-dirs.dirs"
set +a

if [ -n "$(ls "$HOME"/.config/profile.d 2>/dev/null)" ]; then
    for f in "$HOME"/.config/profile.d/*; do
        # shellcheck source=/dev/null
        . "$f"
    done
fi
