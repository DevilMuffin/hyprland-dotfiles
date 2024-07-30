#!/bin/bash

directory="$HOME/Pictures/genshinStickers/stickers"

random_png=$(find "$directory" -type f -name "*.png" | shuf -n 1)

if [ -z "$random_png" ]; then
  echo "No PNG files found in the directory."
else
  neofetch --kitty $random_png --size 400px
fi

