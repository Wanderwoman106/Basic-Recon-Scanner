#! /bin/bash

#Basic Recon/Scanning tool to help gather some data quickly on a target. Also my first script.

echo "Simple Re-Con Shell Script for gathering Target data. Must be ran as Root User"
echo
echo
echo $UID &>/dev/null
if  [[ "$UID" != "0" ]]; then
	echo "Sorry you must have root privledges for to run this program"
	exit
elif [[ "$UID" == "0" ]]; then
	read -n 1 -s -r -p "PRESS ANY KEY TO CONTINUE..."	
fi

echo "Enter a DOMAIN to begin scanning, If you are unsure of the domain, leave this input blank"
echo "and only have the IP address, then leave this input blank."
read DOMAIN

if [[ -z "$DOMAIN" ]]; then
	echo "Enter an IP to scan"
		read IP 
			echo "Scanning $IP..." && nmap -PM -Pn $IP
elif [[ -n "$DOMAIN" ]]; then
	echo "Scanning $DOMAIN...." && nmap -PM -Pn $DOMAIN
		echo "Now Enter the IP to your Domain"
		read IP
fi

whois -R $IP
echo
echo "Above is the WHOIS info for your host."
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

echo "Would you like to 'CURL' this domain and save it to a file to analyze? Type Y for Yes or N for No!"
read ANS1

if [[ "$ANS1" == "Y" ]]; then
	echo "Saved to $HOME/NewSiteScan.txt" && curl $DOMAIN -D -o "$HOME/NewSiteScan.txt" 
elif [[ "$ANS1" != "Y" ]]; then
	echo "Domain not Saved!" 
	exit
fi
