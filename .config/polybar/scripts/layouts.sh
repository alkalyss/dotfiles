#!/bin/sh

layouts=("CenterMain" "CenterMainBalanced" "EvenHorizontal" "EvenVertical" "Fibonacci" "GridHorizontal" "MainAndVertStack" "MainAndHorizontalStack" "MainAndDeck" "Monocle" "RightWiderLeftStack" "LeftWiderRightStack")

icons=("頻" "冀" "𤋮" "ﰧ" "侀" "全" "D" "Main & H Stack" "Main & Deck" "" "R>L Stack" "WD")

layout=$(leftwm-state -q | jq -r '.["workspaces"] | .[0].layout')

case $layout in
	${layouts[0]}) echo ${icons[0]};;
	${layouts[1]}) echo ${icons[1]};;
	${layouts[2]}) echo ${icons[2]};;
	${layouts[3]}) echo ${icons[3]};;
	${layouts[4]}) echo ${icons[4]};;
	${layouts[5]}) echo ${icons[5]};;
	${layouts[6]}) echo ${icons[6]};;
	${layouts[7]}) echo ${icons[7]};;
	${layouts[8]}) echo ${icons[8]};;
	${layouts[9]}) echo ${icons[9]};;
	${layouts[10]}) echo ${icons[10]};;
	${layouts[11]}) echo ${icons[11]};;
	*) echo ${icons[6]};;
esac
