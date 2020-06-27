#!/bin/bash

# multi-monitor toggling 

# PREREQUISITE
# bar must be generated in order
# for eg) all eDP1 {top/sub1/sub2...} must be generated before HDMI1 {top/sub1/sub2...}
#
# bash, xdotool, xwininfo

#1. Obtain calee's bar index from given barname($2) and id($3)
SOURCE_BARS=($(xdotool search --name $2))

INDEX=-1;

for i in "${!SOURCE_BARS[@]}"; do
    if [ "${SOURCE_BARS[$i]}" -eq "$3" ]; then
        INDEX=$i;
        break;
    fi
done

## boundary check
if [ $INDEX -lt 0 ]; then
    notify-send "Failed toggling subbar. Terminating..."
    exit 1
fi

#2. get list of $1 subbars, and toggle 'wanted bar' with calculated INDEX
TARGET_BARS=($(xdotool search --name $1))
ID=${TARGET_BARS[$INDEX]};

## Toggle bar visibility
if xwininfo -id $ID | grep -q "IsViewable"; then
    xdotool windowunmap $ID
else
    xdotool windowmap $ID
fi

