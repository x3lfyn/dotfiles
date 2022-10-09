#!/bin/bash

case $1 in
    --used)
        echo $(df -h | grep /dev/sda2 | awk '{print $3}' | sed "s/G//")
    ;;
    --total)
        echo $(df -h | grep /dev/sda2 | awk '{print $2}' | sed "s/G//")
    ;;
    --percentage)
        echo $(df -h | grep /dev/sda2 | awk '{printf "%0.1f",$3/$2*100}')
    ;;
    --download)
        echo "??"
    ;;
    --upload)
        echo "??"
    ;;
esac