#!/bin/sh
sed -i \
         -e 's/#EBE4E1/rgb(0%,0%,0%)/g' \
         -e 's/#484647/rgb(100%,100%,100%)/g' \
    -e 's/#F5EEEA/rgb(50%,0%,0%)/g' \
     -e 's/#5C4F89/rgb(0%,50%,0%)/g' \
     -e 's/#F5EEEA/rgb(50%,0%,50%)/g' \
     -e 's/#484647/rgb(0%,0%,50%)/g' \
	"$@"
