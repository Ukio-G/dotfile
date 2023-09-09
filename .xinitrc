xrdb -merge ${HOME}/.Xresources
guake &
exec feh --bg-fill ${HOME}/dotfile/wallpaper.jpg &
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xbindkeys
exec i3
