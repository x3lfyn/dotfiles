#!/bin/sh

OPENED_WINDOWS=`eww windows | grep -c '*'`

if [ $OPENED_WINDOWS -eq 0 ]; then
    eww open-many\
        bg\
        time-date\
        uptime-updates\
        cpu-mem\
        disk\
        calendarw\
        trackInfo\
        trackPrev\
        trackPP\
        trackNext\
        volume
else
    eww close-all
fi