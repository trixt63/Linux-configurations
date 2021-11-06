#!/bin/bash
cd $HOME/.conkysao2
conky -c ./bottom &
conky -c ./top &
notify-send --icon=$HOME/.conkysao2/login.png "Welcome back" "on $HOSTNAME" & 
