#!/bin/env sh

# killall polybar
pkill polybar
while prep -x polybar >/dev/null; do sleep 0.1; done

# main(top) bar
polybar topbar &
# sub bars
polybar powerbar &

# hide sub bars
until ID=$(xdotool search --name "powerbar"); do sleep 0.1; done
xdotool windowunmap $ID


