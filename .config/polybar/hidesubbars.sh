#!/bin/sh

SUBBARS=$(grep '\[bar' ~/.config/polybar/config -B 1 | tr -d '\n ' | sed 's/--/\n/g' | sed -n '/^;/p' | sed -e 's/\[bar\//\-/g' -e 's/\]//g' -e 's/;/\n/g' | grep 'subbar' | sed 's/.*-//g')
for bar in ${SUBBARS[@]}; do
    xdotool windowunmap $(xdotool search --name $bar)
done
