#!/bin/bash

if swaymsg -t get_outputs | grep -iq hdmi;then
    swaymsg output eDP-1 disable
else
    swaymsg output eDP-1 enable
fi
