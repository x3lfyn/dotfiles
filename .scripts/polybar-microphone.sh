#!/bin/bash

CURRENT_SOURCE=`pactl info | grep "Default Source" | cut -f3 -d" "`

case $1 in
	--icon)
		IS_MUTED=`pactl list sources | grep -A 10 "$CURRENT_SOURCE" | grep "Mute: yes" -c`

		if [[ $IS_MUTED == 0 ]]; then
			echo "" # not muted
		else
			echo "" # muted
		fi
	;;
	--toggle)
		pactl set-source-mute $CURRENT_SOURCE toggle
	;;
esac

