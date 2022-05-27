#!/bin/sh

ARCH_UPDATES=$(checkupdates | wc -l)
AUR_UPDATES=$(yay -Qum | wc -l)

echo "$ARCH_UPDATES/$AUR_UPDATES"