#!/bin/bash
if (($(cat /proc/uptime | sed 's/\..*//g') < 15)); then
    sleep 10
fi
if ping -c 1 -W 2 1.1.1.1 2>&1 >/dev/null; then
   echo "[O]"
else
   echo "[X]"
fi
