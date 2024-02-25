#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xset s off

# keyring config
dbus-update-activation-environment --all
export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# fix for barrier
setxkbmap -device `xinput list --id-only "Virtual core XTEST keyboard"` de

autorandr --load $(cat /etc/hostname) --skip-options crtc

exec i3
