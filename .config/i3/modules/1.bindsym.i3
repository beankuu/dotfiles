## ------------------------------
## bindsym (Keybinds)
## ------------------------------

## Open up terminal
bindsym $mod+Return     exec i3-sensible-terminal

## Window kill command
bindsym $mod+Shift+q    kill
bindsym $mod+F4         kill

## change focus
bindsym $mod+Left       focus left
bindsym $mod+Down       focus down
bindsym $mod+Up         focus up
bindsym $mod+Right      focus right

## move focused window
bindsym $mod+Shift+Left     move left
bindsym $mod+Shift+Down     move down
bindsym $mod+Shift+Up       move up
bindsym $mod+Shift+Right    move right

## split orientation
bindsym $mod+h  split h;exec notify-send 'tile horizontally'
bindsym $mod+v  split v;exec notify-send 'tile vertically'
bindsym $mod+q  split toggle

## toggle fullscreen mode for the focused container
bindsym $mod+f  fullscreen toggle
## toggle tiling / floating
bindsym $mod+t  floating toggle
## change focus between tiling / floating windows
bindsym $mod+Shift+f  fullscreen toggle

## move the currently focused window to the scratchpad
bindsym $mod+minus move scratchpad
## Show the next scratchpad window or hide the focused scratchpad window.
## If there are multiple scratchpad windows, this command cycles through them.
bindsym $mod+equal scratchpad show

# navigate workspaces next / previous
bindsym $mod+Tab            workspace next
bindsym $mod+Shift+Tab      workspace prev
## workspace back and forth (with/without active container)
workspace_auto_back_and_forth   yes
bindsym $mod+b              workspace back_and_forth

## TODO: Change it to Ctrl+Alt($mod)+Del with features
## exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
## Set shut down, restart and locking features
bindsym $mod+0 mode "$mode_system"
set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3exit lock,         mode "default"
    bindsym s exec --no-startup-id i3exit suspend,      mode "default"
    bindsym u exec --no-startup-id i3exit switch_user,  mode "default"
    bindsym e exec --no-startup-id i3exit logout,       mode "default"
    bindsym h exec --no-startup-id i3exit hibernate,    mode "default"
    bindsym r exec --no-startup-id i3exit reboot,       mode "default"
    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

    ## exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}


## Resize window 
### Resize by mouse
floating_modifier $mod
### Resize by key
bindsym $mod+r mode "resize"
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        bindsym Left    resize shrink   width   10 px or 10 ppt
        bindsym Down    resize grow     height  10 px or 10 ppt
        bindsym Up      resize shrink   height  10 px or 10 ppt
        bindsym Right   resize grow     width   10 px or 10 ppt

        # exit resize mode: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

## switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6

## Move focused container to workspace
bindsym $mod+Ctrl+1 move container to workspace 1
bindsym $mod+Ctrl+2 move container to workspace 2
bindsym $mod+Ctrl+3 move container to workspace 3
bindsym $mod+Ctrl+4 move container to workspace 4
bindsym $mod+Ctrl+5 move container to workspace 5
bindsym $mod+Ctrl+6 move container to workspace 6

## Move to workspace with focused container
bindsym $mod+Shift+1 move container to workspace 1; workspace 1
bindsym $mod+Shift+2 move container to workspace 2; workspace 2
bindsym $mod+Shift+3 move container to workspace 3; workspace 3
bindsym $mod+Shift+4 move container to workspace 4; workspace 4
bindsym $mod+Shift+5 move container to workspace 5; workspace 5
bindsym $mod+Shift+6 move container to workspace 6; workspace 6

## reload the configuration file
bindsym $mod+Shift+c reload
## restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart


