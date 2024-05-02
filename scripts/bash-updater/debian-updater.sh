#!/bin/bash
sudo pacman -Syyu
paplay '/usr/share/sounds/ocean/stereo/completion-success.oga' & notify-send -a 'System Updater' 'Main Packages Updated' 'Authentication for AUR Packages needed'
yay
paplay '/usr/share/sounds/ocean/stereo/outcome-success.oga' & notify-send -a 'System Updater' 'User Packages Updated' 'Restart is recommended'
