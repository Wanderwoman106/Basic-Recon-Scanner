# Basic-Recon-Scanner
## Basic Recon tool for scanning hosts/domains (BASH)

## Dependencies

* NMAP (https://nmap.org)
* BASH (Bourne Again Shell)



This program should be ran as root user.

**Basic scanning & recon tool for gathering some info on a host/domain.**

All you need to input is a Domain, and it will take the work from there!
It will utilize **nmap** scan for the IP, open ports, protocols, **whois info**, (so far) and also give you the option to put in a custom **spoofed MAC address for your scans**. I am still adding some more in depth features but this was just a jumping off point for me.

I'm a newbie and it is still a work in progress!

No building or compiling necessary, just a basic BASH script to run. 

# Instructions

* Git clone https://github.com/Wanderwoman106/Basic-Recon-Scanner.git
* cd Basic-Recon-Scanner
* **chmod u+x portscan.sh** OR **chmod 750/740** portscan.sh 

--(obviously permissions are up to you, just make sure you have execute permission!)

* ./portscan.sh

