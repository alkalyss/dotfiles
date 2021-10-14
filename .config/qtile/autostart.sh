#!/bin/bash

killall polybar
polybar -q qtile -c "${XDG_CONFIG:-$HOME/.config}/polybar/default/config.ini" &
