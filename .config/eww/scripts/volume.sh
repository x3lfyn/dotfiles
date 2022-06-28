#!/bin/bash

case $1 in
    --volume)
        echo `amixer sget Master |awk -F"[][]" '/Left:/ { print $2 }' | sed "s/%//"`
    ;;
    --icon)
        MUTE=`amixer sget Master |awk -F"[][]" '/Left:/ { print $4 }'`
        if [ $MUTE == "off" ]; then
            echo ""
            exit
        fi
        VOL=`amixer sget Master |awk -F"[][]" '/Left:/ { print $2 }' | sed "s/%//"`
        if [ $VOL -le 33 ]; then echo ""
        elif [ $VOL -le 66 ]; then echo ""
        else echo ""
        fi
    ;;
    --set-vol)
        amixer -q set Master $2%
    ;;
    --toggle-mute)
        amixer set Master toggle -q
    ;;
esac