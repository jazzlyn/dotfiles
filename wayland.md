# Migrate to Wayland

docu for arch: <https://www.codejam.info/2022/05/migrating-x11-wayland-i3-sway.html>

> :warning: postponed till there is a proper support for discord!
> <https://support.discord.com/hc/en-us/community/posts/360047644231-Native-Wayland-Support>

## alternative apps

- dmenu: bemenu
- feh: imv
- xbacklight: light

## install notes

pacman -S wayland sway bemenu-wayland chromium
pacman -Rns dmenu xorg-xset google-chrome
pacman -Rns xorg-server i3

`nvidia nvidia-utils nvidia-settings` depend on xorg, have to be removed as well.

## special flags for chromium and (vs)code

chromium --ozone-platform-hint=auto
code --enable-features=UseOzonePlatform --ozone-platform=wayland
