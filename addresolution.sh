#!/bin/bash

if [[ "$@" == "" || "$#" != 4 ]]; then
	echo "Usage: addresolution <width> <height> <rate> <xrandr output>"
fi

name=$(gtf $1 $2 $3 | awk '/Modeline/ {print $2}' | tr -d "\"")
args=$(gtf $1 $2 $3 | awk -F"\".*\"" '/Modeline/ {print $2}')

xrandr --newmode $name $args 

xrandr --addmode $4 $name

xrandr --output $4 --mode $name
