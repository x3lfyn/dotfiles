#!/bin/bash

RULE="audiovisualizer state=floating border=off private=on layer=-1 rectangle=2560x300+0+2410 focus=off locked=on sticky=on"

bspc rule -a $RULE

kitty --class audiovisualizer --title audiovisualizer --config ~/.config/kitty/kitty-audiovisualizer.conf cava&
KITTYPID=$!
sleep 0.5

wmctrl -r audiovisualizer -b add,below,sticky
wmctrl -r audiovisualizer -b add,skip_pager,skip_taskbar

wait $KITTYPID
bspc rule -r $RULE

