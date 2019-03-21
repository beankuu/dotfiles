#!/bin/sh

# Obtain bar's window id from barname(argv)
ID=$(xdotool search --name $1)
# Toggle bar visibility
if xwininfo -id $ID | grep -q "IsViewable"; then
    xdotool windowunmap $ID
else
    xdotool windowmap $ID
fi
