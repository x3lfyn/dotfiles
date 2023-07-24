#!/usr/bin/env bash

PICTPATH="$HOME/Pictures/screenshots/screenshot-$(date +%Y.%m.%d-%H.%M.%S)-$(($RANDOM % 100)).png"
echo $PICTPATH

case "$1" in
	--area)
		slurp | grim -c -g - - | tee $PICTPATH | wl-copy -t image/png	
	;;
	--screen)
		grim -c - | tee $PICTPATH | wl-copy -t image/png	
	;;
esac

if [ $? -eq 0 ]; then
	notify-send -i gnome-screenshot -t 1500 "Screenshot created" "<small>$PICTPATH</small>"
else
	notify-send -i gnome-screenshot -t 1500 "Failed to create screenshot" 
fi
