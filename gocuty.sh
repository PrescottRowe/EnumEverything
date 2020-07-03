#!/bin/bash
echo "-------Gobuster meets cutycapt-----"
echo "File will be saved into a gocuty folder"
echo "Enter your target URL/IP:"
read scan
echo "Scanning $scan:"
rm -r gocuty/ 2>/dev/null
mkdir gocuty

gobuster dir -t 50 -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .txt,.php,.html,.yml -u $scan -e | tee ./gocuty/found.txt;
i=0
echo "<HTML><BODY><BR>" > ./gocuty/gocuty.html
for url in $(cat found.txt |grep "Status: 200" |cut -d" " -f1);do
	((i++))
	cutycapt --url=$url --out=$i.png
	echo "<b>"$url":</b> <BR><IMG SRC=\""./gocuty/""$i"".png"\" width=600 border="6"><BR>" >> ./gocuty/gocuty.html
echo "</BODY></HTML>" >> ./gocuty/gocuty.html
done
