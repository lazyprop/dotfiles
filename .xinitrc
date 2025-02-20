setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
xsetroot -cursor_name left_ptr

dunst &
nitrogen --restore &
slstatus &
exec dwm 
#exec xmonad
