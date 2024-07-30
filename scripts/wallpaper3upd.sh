#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/morijin.jpeg

swww img $imgPath
wal -i $imgPath

exec swaync-client -rs
