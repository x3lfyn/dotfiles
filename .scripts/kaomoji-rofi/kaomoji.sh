#!/usr/bin/env bash

current_wid=$(xdo id)
selection=$(rofi -i -dmenu $@ -theme ~/.config/rofi/kaomoji/theme.rasi < $(dirname $0)/kaomoji.txt)
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||"i | cut -d' ' -f1)
echo -n "$kaomoji" | xclip -selection clipboard
xdotool key --window $current_wid --clearmodifiers ctrl+v
