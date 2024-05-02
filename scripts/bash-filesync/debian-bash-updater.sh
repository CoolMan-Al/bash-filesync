#!/bin/bash
sudo apt-get update
paplay '/usr/share/sounds/ocean/stereo/completion-success.oga' & notify-send -a 'System Updater' 'Index Updated' 'Now updating package files'
sudo apt-get upgrade
paplay '/usr/share/sounds/ocean/stereo/outcome-success.oga' & notify-send -a 'System Updater' 'User Packages Updated' 'Restart is recommended'
