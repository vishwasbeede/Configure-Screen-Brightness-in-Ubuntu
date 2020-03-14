#!/bin/bash

#DISP_NAME=$2
cmp=$(echo "1")
if [ -s $1 ]
then
Values=.5
elif [ "$1" = "-h" ] || [ "$1" = "--help" ] 2> /dev/null
then
    echo "	Usage: $0 [option...]  (Brightness_value Display_name ) " >&2
    echo "        Ex: $0 .5 LVDS1 "
    echo "	Default brightness value .5 and default connected display name "
    echo "	Get display name using \" xrandr -q | grep -w 'connected' | awk '{print \$1 }' \"   "
    echo "	Script limited max brightness value as 1 "
    exit 0

elif [ $1 -gt $cmp ] 2> /dev/null
then
Values=1

else
Values=$1
fi

Device=$(xrandr -q | grep -w 'connected' | awk 'NR==1{print $1}')

if [ ! -z $2 ]
then
Device=$( echo "$2" )
fi

xrandr --output $(echo "$Device") --brightness $Values

