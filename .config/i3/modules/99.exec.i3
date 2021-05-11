##==================================================
##                 exec on i3 start    
##==================================================

## Autostart applications
#exec xrandr --dpi 144
exec --no-startup-id nm-applet &
exec --no-startup-id udiskie &
exec --no-startup-id xbindkeys
exec --no-startup-id ibus-daemon -drx
exec --no-startup-id nextcloud &
#exec --no-startup-id /usr/bin/inidicator-kdeconnect
exec --no-startup-id dunst &

exec --no-startup-id $HOME/.fehbg
exec --no-startup-id compton -b
exec --no-startup-id conky -c $HOME/.conkyrc
exec --no-startup-id $HOME/.config/polybar/scripts/launch.sh &

## Autostart layout
exec i3-msg 'workspace 1; append_layout ~/.config/i3/default-layout.json' #$HOME Not allowed
exec urxvt -name "init_1"
exec urxvt -name "init_2"
exec urxvt -name "init_3"
