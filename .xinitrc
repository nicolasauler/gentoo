#!/bin/sh

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

exec dbus-launch --exit-with-session i3
