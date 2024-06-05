#!/bin/sh

# env should be set at wm launch
if test -z $WALLPAPER_PATH; then
	echo "Environmental variable \$WALLPAPER_PATH unset"
	exit 1
fi

count=`find $WALLPAPER_PATH -type f | wc -l`

if test -z $WALLPAPER_SEL; then
	WALLPAPER_SEL=$(($RANDOM%$count+1))
else
	WALLPAPER_SEL=$((($WALLPAPER_SEL)%$count+1))
fi

export WALLPAPER_SEL

wallpaper=`find $WALLPAPER_PATH -type f | sed -n "$WALLPAPER_SEL"p`
swww img "$wallpaper" --transition-type simple
#swww img "`find $WALLPAPER_PATH -type f | shuf -n 1`" --transition-type simple
