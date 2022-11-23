#!/bin/bash

SCRSHOT="/home/vobbla16/Pictures/screenshots/$(date +screenshot-%d-%m-%y-%H%M-%S.png)"

case $1 in
	--area)
		grimshot save area - | tee $SCRSHOT | wl-copy
	;;
	--screen)
		grimshot save screen - | tee $SCRSHOT | wl-copy
	;;
esac
