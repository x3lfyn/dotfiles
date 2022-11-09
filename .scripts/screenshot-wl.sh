#!/bin/bash

SCRSHOT="/home/kadyklesha/Pictures/screenshots/$(date +screenshot-%d-%m-%y-%H%M-%S.png)"

grimshot save area - | tee $SCRSHOT | wl-copy
