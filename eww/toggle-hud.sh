#!/bin/bash

if eww active-windows | grep -q "four_boxes"; then
    eww close-all
else
    eww open-many active_workspace audio_status cpu_ram_storage_bars four_boxes net_bars orange_workspace power-cooling_header_text power_mode_text right_fan_data right_internet_text visualizer_window welcome_text workspace_window_text ascii_decor_frame
fi
