#!/bin/bash

#$1 = bar to be hidden (eg. powerbar)
#$2 = main bar (eg. topbar)

echo $(xdotool getmouselocation --shell | grep WINDOW | sed 's/.*=\(.*\)/\1/')
