#!/bin/sh

killall waybar
waybar &
disown
