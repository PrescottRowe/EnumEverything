#! /bin/bash
#first checks if an argument was passed
if [-z “$1”]; then
    echo “[*] Simple Zone trasfer script”      
    echo “[*] Useage : $0 <domain name>”
    exit 0
fi
# if argument was given, identify the DNS servers for the domain
for  server is $(host -t ns $1 |cut -d" " -f4);do
# For each of these servers, attempt a zone transfer
    host -l $1 $server |grep “has address”
done           
