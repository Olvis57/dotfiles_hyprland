#!/bin/bash

WINDOWS="active_workspace audio_status cpu_ram_storage_bars four_boxes net_bars orange_workspace power-cooling_header_text power_mode_text right_fan_data right_internet_text welcome_text workspace_window_text ascii_decor_frame"

LOCK="/tmp/eww-hud-toggle.lock"

if ! mkdir "$LOCK" 2>/dev/null; then
    exit 0
fi

trap 'rmdir "$LOCK"' EXIT

LAYERS=$(hyprctl layers | grep -c 'namespace: gtk-layer-shell')

if [ "$LAYERS" -gt 0 ]; then
    eww close-all

    for i in {1..50}; do
        LAYERS=$(hyprctl layers | grep -c 'namespace: gtk-layer-shell')
        [ "$LAYERS" -eq 0 ] && break
        sleep 0.1
    done

    if [ "$LAYERS" -ne 0 ]; then
        EWW_PID=$(hyprctl layers | awk '/namespace: gtk-layer-shell/ {print $NF; exit}')
        [ -n "$EWW_PID" ] && kill "$EWW_PID"
    fi
else
    eww open-many $WINDOWS

    for i in {1..50}; do
        LAYERS=$(hyprctl layers | grep -c 'namespace: gtk-layer-shell')
        [ "$LAYERS" -eq 13 ] && break
        sleep 0.1
    done
fi
