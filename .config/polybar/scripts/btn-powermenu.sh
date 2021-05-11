#!/usr/bin/env bash

## Original Author  : Aditya Shakya [adi1090x@gmail]
## From adi1090x/rofi github

## Modified by beankuu@gmail.com

menu_dir="polybar"
theme="powermenu"
rofi_command="rofi -theme $menu_dir/$theme"

uptime=$(uptime -p)

## Options
shutdown=""
reboot=""
lock=""
logout=""

## Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"

case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		betterlockscreen -l
        ;;
    $logout)
		i3-msg exit
        ;;
esac
