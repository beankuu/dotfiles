#!/bin/env sh

# killall polybar
pkill polybar
sleep 0.1;

# main bar
polybar i3bar &
# sub bar
polybar powerbar &

sleep 0.5;
# hide sub bars
ID=$(xdotool search --name "powerbar")
xdotool windowunmap $ID


