#!/bin/bash

if /usr/bin/mullvad status | grep -q 'Connected'; then
    /usr/bin/mullvad disconnect
else
    /usr/bin/mullvad connect
fi
