#!/usr/bin/bash

BATTINFO=$(acpi -b)

THRESHOLD_TIME=00:30:00
THRESHOLD_PERCENTAGE=15

#echo $BATTINFO | cut -f 4 -d " " | sed 's/%,//'

if [[ ( `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < $THRESHOLD_TIME ) || ( `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " " | sed 's/%,//'` < $THRESHOLD_PERCENTAGE ) ]]; then
	#DISPLAY=:0.0 /usr/bin/notify-send "Low battery" "$BATTINFO"				# ubuntu
	#twmnc -i ~/icons/notification/warning.png -t "Low battery" -c "$BATTINFO"	# twmn
	twmnc -i ~/icons/notification/critical.png --bg '#FF0000' -t "Low battery" -c "$BATTINFO"	# twmn
fi
