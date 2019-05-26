#! /bin/bash

##Basic ass automated tool to run some scans on a domain/host using nmap and other net tools. 

echo "Simple Re-Con Shell Script for gathering Target data. Must be ran as Root User"
echo

read -n 1 -s -r -p "PRESS ANY KEY TO CONTINUE"

echo
echo $EUID &>/dev/null
if  [[ "$EUID" != "0" ]]; then
	echo "Sorry you must have root privledges for to run this program"
	exit
elif [[ "$EUID" == "0" ]]; then
	 echo "Enter Domain To Start Scanning..."
		read DOMAIN
fi

echo
echo "Scanning...."

nmap -PS -Pn $DOMAIN

echo "To continue scanning options, enter target IP. To quit hit CTRL+C"
read IP

whois $IP

read -n 1 -s -r -p "PRESS ANY KEY TO CONTINUE"
echo

echo "Next, let's spoof our MAC address for scanning anonymity purposes."
echo "Input a false MAC address below in the format 00:00:00:00:00:00 using numbers 0-9 and letters A-F:"
read MAC

echo "Scanning..."

nmap -sO -T4 -Pn $IP --spoof-mac $MAC

echo "Would you like to scan for TOP PORTS, or ALL PORTS? Input T for Top Ports or A."
read PORTVAR

if [[ "$PORTVAR" == "T" ]]; then
	echo "Scanning Top Ports..." && nmap -sU --top-ports 100 $IP -T4 --spoof-mac $MAC
elif [[ "$PORTVAR" != "T" ]]; then
	echo "Scanning ALL Ports..." && nmap -sU -sT -p- $IP -T4 --spoof-mac $MAC
fi


