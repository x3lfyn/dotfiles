#!/bin/bash

case $1 in 
    --percentage)
        echo $(free | grep Mem | awk '{printf "%d",$3/$2 * 100.0}') 
    ;;

esac