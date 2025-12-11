#!/bin/bash

device=$(bluetoothctl devices Connected | head -n 1 | cut -d ' ' -f 3-)

echo $device
if [ "$device" = "/org/bluez/hci0 " ]; then
    icon="󰂲"
    tooltip="No device connected"
    class="disconnected"
else
    icon="󰂱"
    tooltip="Connected to: $device"
    class="connected"
fi

echo "{\"text\":\"$icon\",\"tooltip\":\"$tooltip\",\"class\":\"$class\"}"

