#!/bin/bash

links=("www.ntua.gr" "www.uoa.gr" "www.eap.gr" "www.auth.gr" "www.uoi.gr" "www.uth.gr" "www.unipi.gr" "ionio.gr" "www.uop.gr" "www.uoc.gr" "www.uowm.gr" "www.ucy.ac.cy" "eth.ch" "www.epfl.ch" "www.camp.ac.uk" "www.lse.ac.uk" "www.imperial.ac.uk" "www.ox.ac.uk" "www.fu-berlin.de" "www.hu-berlin.de" "www.uva.nl" "www.tudelft.nl" "www.ntnu.edu" "www.berkeley.edu" "www.mit.edu" "www.princeton.edu" "www.caltech.edu")

rm results.txt

for link in "${links[@]}"
do
	echo $link >> results.txt
	traceroute $link >> results.txt
	printf "\n" >> results.txt
done

sudo openvpn --config $HOME/UPatrasVPN/UPatras.ovpn --auth-user-pass $HOME/UPatrasVPN/auth-pass --daemon
sleep 5s
printf "VPN ON\n" >> results.txt

for link in "${links[@]}"
do
	echo $link >> results.txt
	traceroute $link >> results.txt
	printf "\n" >> results.txt
done

sudo pkill openvpn
