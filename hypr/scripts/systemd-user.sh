#!/usr/bin/bash

# hyprland does not set DISPLAY/WAYLAND_DISPLAY in the systemd user environment
# Adapted from xorg's 50-systemd-user.sh, which achieves a similar goal.

# Upstream refuses to set XDG_CURRENT_DESKTOP so we have to.
systemctl --user set-environment XDG_CURRENT_DESKTOP=hyprland
systemctl --user import-environment DISPLAY \
    WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP

hash dbus-update-activation-environment 2>/dev/null && \
    dbus-update-activation-environment --systemd DISPLAY \
    XDG_CURRENT_DESKTOP=hyprland \
    WAYLAND_DISPLAY
