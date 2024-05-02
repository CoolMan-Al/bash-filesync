#!/bin/bash
case $1 in
    '')
        echo 'No Time Specified'
        ;;
    [0-9]*[smhdy])
        termdown -f colossal $1
        paplay "/usr/share/sounds/ocean/stereo/bell-window-system.oga" & notify-send -a 'Timer' 'Countdown finished'
        ;;
    *)
        echo 'Invalid Input'
esac

