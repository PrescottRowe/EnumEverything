#!/bin/bash
echo "-------Gobuster meets cutycapt-----"
echo "Your files will be in the gocuty folder. Also make sure to edit the gobuster command on line 11 to your preference."
echo "Enter your target URL/IP:"

read scan
echo "Scanning $scan:"
rm -r gocuty/ 2>/dev/null
mkdir gocuty

gobuster dir -t 50 -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .txt,.php,.html,.yml -u $scan -e | tee ./gocuty/found.txt;
i=0
echo "<HTML><BODY><BR>" > ./gocuty/gocuty.html
for url in $(cat ./gocuty/found.txt |grep "Status: 200\|Status: 204\|Status: 301\|Status: 302\|Status: 307\|Status: 403" |cut -d" " -f1);do
	((i++))
	cutycapt --url=$url --out=./gocuty/$i.png
	echo "<b>"$url":</b> <BR><IMG SRC=\""$i"".png"\" width=600 border="6"><BR><BR><BR>" >> ./gocuty/gocuty.html
done
echo "</BODY></HTML>" >> ./gocuty/gocuty.html
