#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wallpaper10.jpg

swww img $imgPath
wal -i $imgPath

exec swaync-client -rs

