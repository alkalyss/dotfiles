#!/bin/bash

# Read presets from easyeffects and create an array of output presets
IFS=':' read -ra tokens <<< "$(easyeffects -p)"
for i in "${tokens[@]}"; do
	if [[ $i = "Output Presets" ]]; then
		continue
	fi
	IFS="," read -ra output_presets <<< "$i"
done

length=${#output_presets[@]}
index=${1:-0}

if [ $index -lt $length ]; then
	easyeffects -l ${output_presets[$index]}
	easyeffects -a
	exit $index
else
	echo "Unknown preset"
	exit -1
fi
