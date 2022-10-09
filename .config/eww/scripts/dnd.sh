#!/bin/bash

case $1 in 
    --icon)
        if [[ `dunstctl is-paused` = "true" ]]; then
            echo ""
        else 
            echo ""
        fi
    ;;
    --toggle)
        dunstctl set-paused toggle
    ;;
esac