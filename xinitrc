#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[[ -f $sysresources ]] && xrdb -merge $sysresources
[[ -f $sysmodmap ]] && xmodmap $sysmodmap
[[ -f $userresources ]] && xrdb -merge $userresources
[[ -f $usermodmap ]] && xmodmap $usermodmap

xset s off

# keyring config
dbus-update-activation-environment --all
export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# fix for barrier
setxkbmap -device `xinput list --id-only "Virtual core XTEST keyboard"` de

autorandr --load $(cat /etc/hostname) --skip-options crtc

exec i3
