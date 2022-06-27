#!/bin/sh

case $1 in
    --load)
        USAGE=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%d",100 - $1""}'`
        echo $USAGE
    ;;

    --temp)
        echo `sensors nct6779-isa-0290 | sed '29!d' | awk '{print$3}' | cut -c 2- `
    ;;
esac