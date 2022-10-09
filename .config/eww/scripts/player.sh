#!/bin/bash

ADDITIONAL_TMP="/tmp/trackAdditionalInfoStatus"

playerctl -s -p spotify status > /dev/null
PLAYERCTL_STATUS=$?

case $1 in
    --album-art)
        URL=`playerctl -s -p spotify metadata -f {{mpris:artUrl}}`
        if [ $PLAYERCTL_STATUS -eq 1 ]; then 
            echo "$HOME/.config/eww/noTrack.svg"
            exit
        else
            TMP=`echo $HOME/temp/albumCover.png`
            curl -s $URL --output $TMP > /dev/null
            echo $TMP
        fi
    ;;
    --subscribe)
        if ! [ -f $ADDITIONAL_TMP ]; then touch $ADDITIONAL_TMP; fi
        tail -F $ADDITIONAL_TMP
    ;;
    --additional-open)
        echo true >> $ADDITIONAL_TMP
    ;;
    --additional-close)
        echo false >> $ADDITIONAL_TMP
    ;;
    --track-title)
        if [ $PLAYERCTL_STATUS -eq 1 ]; then
            echo "No track"
            exit
        else 
            echo `playerctl -p spotify metadata -f {{xesam:title}}`
        fi
    ;;
    --track-artist)
        if [ $PLAYERCTL_STATUS -eq 1 ]; then
            echo "No track"
            exit
        else 
            echo `playerctl -p spotify metadata -f {{xesam:artist}}`
        fi
    ;;
    --play-pause)
        if [ $PLAYERCTL_STATUS -ne 1 ]; then
            playerctl -p spotify play-pause
        fi
    ;;
    --play-pause-icon)
        if [ $PLAYERCTL_STATUS -eq 1 ]; then
            echo 
        else
            PLAYER_STATUS=`playerctl -p spotify status`
            if [ $PLAYER_STATUS == "Playing" ]; then
                echo 
            else
                echo 
            fi
        fi
    ;;
    --next)
        if [ $PLAYERCTL_STATUS -ne 1 ]; then
            playerctl -p spotify next
        fi
    ;;
    --previous)
        if [ $PLAYERCTL_STATUS -ne 1 ]; then
            playerctl -p spotify previous
        fi
    ;;
esac