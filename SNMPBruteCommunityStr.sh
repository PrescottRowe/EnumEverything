//make or download a SMTP common community strings file
//ex. put “public”"private""manager" into a file called community.
//put IPs into a file

CMDs:
#for ip in $(seq 200 254); do echo 192.168.31$ip;done > ips
#onesixtyone -c community -i ips
