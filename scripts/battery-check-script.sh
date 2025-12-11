#!/bin/bash

# write to log when script is called
printf 'battery-check script: started' | systemd-cat -t check-battery 

# get battery info
BATTINFO=`acpi -b`

# if you're current Discharging and the battery percentage is less than 20%,
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " "` < 20% ]] ; then
        printf 'battery-check script: battery low condition is true' | systemd-cat -t check-battery # write to log if condition is true

				# send the user a notification
        DISPLAY=:0 /usr/bin/notify-send -t 0 -u critical "Low Battery" "$BATTINFO"
				# play a sound :)
				paplay ~/.config/sounds/discharged-battery.mp3

# if you're currently Charging and the battery percentage is more than 95%, also send out a notification, but this time, green :)
elif [[ `echo $BATTINFO | grep Charging` && `echo $BATTINFO | cut -f 4 -d " "`     > 95% ]] ; then
				# send the user a notification
        DISPLAY=:0 /usr/bin/notify-send -t 0 -u low "Battery Full!" "$BATTINFO"
				# play a notification sound :)
				paplay ~/.config/sounds/bell-notification.mp3
fi
