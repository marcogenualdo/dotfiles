#!/bin/bash

# Get WiFi status
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" == "enabled" ]; then
    # Get list of available networks
    networks=$(nmcli -t -f SSID,SECURITY,SIGNAL dev wifi list | sed 's/:/ - /g' | sed 's/^/  /')
    
    # Add toggle option
    options="  Turn WiFi Off\n$networks"
    
    chosen=$(echo -e "$options" | rofi -dmenu -p "WiFi" -theme-str 'window {width: 400px;}')
    
    if [ -n "$chosen" ]; then
        if [[ "$chosen" == *"Turn WiFi Off"* ]]; then
            nmcli radio wifi off
        else
            # Extract SSID (everything before " - ")
            ssid=$(echo "$chosen" | sed 's/  //' | sed 's/ - .*//')
            
            # Check if network requires password
            security=$(nmcli -t -f SSID,SECURITY dev wifi list | grep "^$ssid:" | cut -d: -f2)
            
            if [[ "$security" != "" && "$security" != "--" ]]; then
                password=$(rofi -dmenu -p "Password for $ssid" -password)
                if [ -n "$password" ]; then
                    nmcli dev wifi connect "$ssid" password "$password"
                fi
            else
                nmcli dev wifi connect "$ssid"
            fi
        fi
    fi
else
    chosen=$(echo -e "  Turn WiFi On" | rofi -dmenu -p "WiFi")
    if [ -n "$chosen" ]; then
        nmcli radio wifi on
    fi
fi
