## ------------------------------
## Settings
## ------------------------------

## New Window Settings
new_window pixel 2 
new_float normal

## Theme colors         bar_border      win_border      text            indicator
client.focused          $foreground     $foreground     $background     $foreground
client.focused_inactive $background-alt $background-alt $background-alt $background-alt
client.unfocused        $background     $background     $foreground     $background
client.urgent           $background     $foreground-alt $background     $foreground-alt
client.placeholder      $background-alt $background-alt $background-alt $background-alt
client.background       $background

## switch to workspace with urgent window automatically
for_window [urgent=latest] focus

