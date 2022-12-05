#!/bin/bash

NOTIF_ICON="$HOME/.local/share/icons/$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")/apps/scalable/colorpicker.svg"

COLOR=`hyprpicker -n`
wl-copy $COLOR
notify-send -i $NOTIF_ICON -t 5000 "Picked color." "<small>$COLOR</small>"
