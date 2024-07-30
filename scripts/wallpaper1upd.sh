#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/main.png

swww img $imgPath
wal -i $imgPath

killall waybar
waybar &
disown

exec swaync-client -rs
