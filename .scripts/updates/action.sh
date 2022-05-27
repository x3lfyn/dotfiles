#!/bin/bash

italic=$(tput sitm) 
reset=$(tput sgr0)

echo -e '[L] \033[3mUpdates list:\033[0m'

checkupdates+aur

while true; do
  read -p "[?] ${italic}Do you wish to update system?${reset} " yn
    case $yn in
        [Yy]* ) yay; break;;
        [Nn]* ) exit;;
        * ) echo -e "[!] \033[3mPlease answer yes or no.\033[0m";;
    esac
done

