#!/bin/bash

killall polybar
polybar -q laptop -c "${XDG_CONFIG:-$HOME/.config}/polybar/default/config.ini" &
