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

# launch gnome-keyring-daemon on startup (i3 only)
if command -v gnome-keyring-daemon &> /dev/null; then
  dbus-update-activation-environment --all
  gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
fi

if command -v autorandr &> /dev/null; then
  autorandr --load $(cat /etc/hostname) --skip-options crtc
fi

exec i3
