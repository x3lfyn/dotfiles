#!/bin/bash

#SCRSHOT="/home/kadyklesha/Documents/temp/screenshot.`date +%H%M%S.%d%m%y`.png"
SCRSHOT="/home/kadyklesha/Pictures/screenshots/$(date +screenshot-%d-%m-%y-%H%M-%S.png)"

maim -s $SCRSHOT
xclip -selection clipboard -t image/png -i $SCRSHOT
