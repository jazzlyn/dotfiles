#!/bin/sh

connectedPrimary=$(xrandr | grep " connected primary" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
connectedSecondary=$(xrandr | grep " connected (normal" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

echo $connectedSecondary

if ([ -z "$connectedSecondary" ])
then
    xrandr --output $connectedPrimary --auto
else
    xrandr --output $connectedPrimary --auto --output $connectedSecondary --auto --above $connectedPrimary
fi
