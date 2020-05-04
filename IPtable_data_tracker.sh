#! /bin/bash
#----------------ONLY FOR CTF------------
# reset all conters and iptable rules
iptables -Z && iptables -F
# measure incoming traffic to ip 
iptables -I INPUT 1 -S <ip> -j ACCEPT
# measure outgoing traffic to ip 
iptables -I OUTPUT 1 -d <ip> -j ACCEPT
