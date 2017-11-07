#!/bin/sh

function connectHDMI(){
    xrandr --output HDMI-1 --auto --above eDP-1
}

function disconnectHDMI(){
    xrandr --output HDMI-1 --off
}

xrandr | grep "HDMI-1 connected" &> /dev/null && connectHDMI || disconnectHDMI
