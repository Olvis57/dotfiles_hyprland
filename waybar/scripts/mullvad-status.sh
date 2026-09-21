#!/bin/bash

if /usr/bin/mullvad status | grep -q 'Connected'; then
    echo "<span foreground='#fab387'>[ФАНТОМ]: Copenhagen</span>"
else
    echo "<span foreground='#bf616a'>[ФАНТОМ]: KAPUTT</span>"
fi
