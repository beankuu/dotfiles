#!/bin/sh
# Script for hiding all [bar/... in polybar config
# Used for mouse binding

SUBBARS=$(grep '\[bar' ~/.config/polybar/config -B 1 | tr -d '\n ' | sed 's/--/\n/g' | sed -n '/^;/p' | sed -e 's/\[bar\//\-/g' -e 's/\]//g' -e 's/;/\n/g' | grep 'subbar' | sed 's/.*-//g')
for bars in ${SUBBARS[@]}; do
    for bar in $(xdotool search --name $bars); do
        xdotool windowunmap $bar
    done
done
