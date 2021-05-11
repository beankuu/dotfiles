#!/bin/bash

# 0. preset [manual]
BARS=(topbar)

# 1. Killall running polybar
killall -q polybar

if type "xrandr"; then

# 2. Start bars && Multi-Monitor
## grep all connected monitors
MONINFO=$(xrandr --query | grep ' connected' | cut -d ' ' -f 1 | xargs)
## for all connected monitors
for mon in $MONINFO; do
    ## load bars (which are marked to be loaded)
    for bar in ${BARS[@]}; do
        MONITOR=$mon polybar $bar &
    done
done
fi

