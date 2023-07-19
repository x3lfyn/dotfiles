#!/usr/bin/env bash

STEP_PERCENT="3"

notify() {
	VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Eo '[0-1].[0-9]+' | awk '{ print $1 * 100 }')
	MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c 'MUTE')

	if [ $MUTED -eq 1 ];then
		MSG="Muted"
		ICON="audio-volume-muted-symbolic"
	else
		MSG=$VOLUME%
		if [ $VOLUME -ge 0 ] && [ $VOLUME -le 33 ]; then
			ICON="audio-volume-low-symbolic"
		elif [ $VOLUME -gt 33 ] && [ $VOLUME -le 66 ]; then 
			ICON="audio-volume-medium-symbolic"
		else
			ICON="audio-volume-high-symbolic"
		fi

	fi

	notify-send -a volume-notify -u normal -t 1300 -r 1337 -i $ICON -h int:value:$VOLUME -h string:synchronous:volume -h string:x-canonical-private-synchronous:sys-notify Volume $MSG

}

case "$1" in
	--up)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ $STEP_PERCENT%+
	;;
	--down)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ $STEP_PERCENT%-
	;;
	--mute)
		wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	;;
esac
notify
