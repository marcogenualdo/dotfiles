#!/bin/bash

# Check bluetooth status
bt_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$bt_status" == "yes" ]; then
    # Get paired devices
    devices=$(bluetoothctl devices | sed 's/Device //' | sed 's/^/  /')
    
    # Add options
    options="  Turn Bluetooth Off\n  Scan for Devices\n$devices"
    
    chosen=$(echo -e "$options" | rofi -dmenu -p "Bluetooth" -theme-str 'window {width: 400px;}')
    
    if [ -n "$chosen" ]; then
        if [[ "$chosen" == *"Turn Bluetooth Off"* ]]; then
            bluetoothctl power off
        elif [[ "$chosen" == *"Scan for Devices"* ]]; then
            bluetoothctl scan on &
            sleep 5
            bluetoothctl scan off
            exec "$0"
        else
            # Extract MAC address
            mac=$(echo "$chosen" | awk '{print $1}')
            
            # Check if device is connected
            connected=$(bluetoothctl info "$mac" | grep "Connected" | awk '{print $2}')
            
            if [ "$connected" == "yes" ]; then
                bluetoothctl disconnect "$mac"
            else
                bluetoothctl connect "$mac"
            fi
        fi
    fi
else
    chosen=$(echo -e "  Turn Bluetooth On" | rofi -dmenu -p "Bluetooth")
    if [ -n "$chosen" ]; then
        bluetoothctl power on
    fi
fi
