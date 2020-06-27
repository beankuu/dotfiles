#!/bin/bash

# 0. Auto config
BARS=$(grep '\[bar' ~/.config/polybar/config -B 1 | tr -d '\n ' | sed 's/--/\n/g' | sed -n '/^;/p' | sed -e 's/\[bar\//\-/g' -e 's/\]//g' -e 's/;/\n/g')
MAINBARS=
SUBBARS=
 ##exclude "exclude-" from bar list
 for bar in $BARS; do
    if [[ $bar == "mainbar"* ]]; then
        MAINBARS+=$(echo $bar | sed 's/.*-//g')
    elif [[ $bar == "subbar"* ]]; then
        SUBBARS+=$(echo $bar | sed 's/.*-//g')
    fi
done
BARS=( "${MAINBARS[@]}" "${SUBBARS[@]}" )

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

# 3. Wait for all bars to be loaded
for bar in ${BARS[@]}; do
    while [[ -z "$(xdotool search --name $bar)" ]]; do sleep 0.1; done 
done

# 4. hide all sub-bars
for bars in ${SUBBARS[@]}; do
    for bar in $(xdotool search --name $bars); do
        xdotool windowunmap $bar
    done
done
