#!/bin/sh

layouts=("CenterMain" "CenterMainBalanced" "EvenHorizontal" "EvenVertical" "Fibonacci" "GridHorizontal" "MainAndVertStack")

icons=("Center Main" "Center Main Balanced" "Even Horizontal" "Even Vertical" "Fibonacci" "Grid Horizontal" "Main & Stack")

layout=$(leftwm-state -q | jq -r '.["workspaces"] | .[0].layout')

case $layout in
	${layouts[0]}) echo ${icons[0]};;
	${layouts[1]}) echo ${icons[1]};;
	${layouts[2]}) echo ${icons[2]};;
	${layouts[3]}) echo ${icons[3]};;
	${layouts[4]}) echo ${icons[4]};;
	${layouts[5]}) echo ${icons[5]};;
	${layouts[6]}) echo ${icons[6]};;
esac
