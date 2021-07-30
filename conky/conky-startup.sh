#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky"
   conky -c "$HOME/.conky/simplemanjaro2.conkyrc" &
   exit 0
fi
