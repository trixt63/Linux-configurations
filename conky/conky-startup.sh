#!/bin/sh

if [ "$DESKTOP_SESSION" = "lightdm-xsession" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky"
#   conky -c "$HOME/.conky/simplemanjaro-gruvdark.conkyrc" &
   conky -c "$HOME/.conky/sidecard_conky_by_mzpsh_d9gzhjv/.conkyrc" &
   exit 0
fi
