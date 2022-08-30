set -l bstatus (bluetoothctl show $BLUETOOTH_CONTROLLER | rg Powered | awk '{print $2}')

if [ $bstatus = yes ]
    bluetoothctl power off
else
    echo $DEFAULT_BLUETOOTH_ADDRESS
    bluetoothctl power on && bluetoothctl connect $DEFAULT_BLUETOOTH_ADDRESS
end
