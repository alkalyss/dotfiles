#!/bin/bash

killall polybar
if [[ $HOSTNAME == "laptop" ]]; then
	polybar -q laptop -c "${XDG_CONFIG:-$HOME/.config}/polybar/default/config.ini" &
else
	polybar -q desktop -c "${XDG_CONFIG:-$HOME/.config}/polybar/default/config.ini" &
fi
