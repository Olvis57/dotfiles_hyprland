#!/bin/bash

STATUS=$(/usr/bin/mullvad status)

if echo "$STATUS" | grep -q '^Connected'; then
    LOCATION=$(echo "$STATUS" | awk -F'Visible location:[[:space:]]*' '/Visible location:/ {split($2, a, ", "); split(a[2], b, "."); print b[1]}')

    echo "<span foreground='#fab387'><span font_family='Droidobesh Depot'>PHANTOM</span>: ${LOCATION}</span>"
else
    echo "<span foreground='#bf616a'><span font_family='Droidobesh Depot'>PHANTOM</span>: Offline</span>"
fi
