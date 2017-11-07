#!/bin/sh

function connectedHDMI(){
    i3lock -f -c 000000 -i ~/.dotfiles/wallpaper/archlinux.elfenlied-1920.png
}

function disconnectedHDMI(){
    i3lock -f -i ~/.dotfiles/wallpaper/archlinux.elfenlied-1440.png
}

xrandr | grep "HDMI-1 connected" &> /dev/null && connectedHDMI || disconnectedHDMI
