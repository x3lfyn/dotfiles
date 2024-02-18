#!/usr/bin/env bash

case "$1" in
  --icon)
    if ip link show waybar >/dev/null 2>&1; then
      echo 󰖂
    else
      echo 󱙱
    fi
  ;;
  --toggle)
    if ip link show waybar >/dev/null 2>&1; then
      pkexec wg-quick down waybar
    else
      pkexec wg-quick up waybar
    fi
  ;;
esac
