#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/main.png

swww img $imgPath
wal -i $imgPath

exec swaync-client -rs
