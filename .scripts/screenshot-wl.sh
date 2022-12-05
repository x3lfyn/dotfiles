#!/bin/bash

SCRSHOT="$HOME/Pictures/screenshots/$(date +screenshot-%d-%m-%y-%H%M-%S.png)"

NOTIF_ICON="$HOME/.local/share/icons/$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")/apps/scalable/gscreenshot.svg"

case $1 in
	--area)
		grimshot save area - | tee $SCRSHOT | wl-copy
		notify-send -i $NOTIF_ICON -t 1500 "Area screenshot created." "<small>$SCRSHOT</small>"
	;;
	--screen)
		grimshot save screen - | tee $SCRSHOT | wl-copy
		notify-send -i $NOTIF_ICON -t 1500 "Screen screenshot created." "<small>$SCRSHOT</small>"
	;;
esac
