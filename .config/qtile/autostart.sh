#!/bin/bash

killall polybar
if [[ $(hostname) == "laptop" ]]; then
	config=laptop
else
	config=desktop
fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -q $config  &
done
