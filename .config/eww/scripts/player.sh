#!/bin/bash

ADDITIONAL_TMP="/tmp/trackAdditionalInfoStatus"

case $1 in
    --album-art)
        URL=`playerctl -p spotify metadata -f {{mpris:artUrl}}`
        TMP=`echo $HOME/temp/albumCover.png`
        curl -s $URL --output $TMP > /dev/null
        echo $TMP
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
esac