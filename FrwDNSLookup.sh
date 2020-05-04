#!/bin/bash

for name in $(cat subdomainList.txt);do
	host $name.ligit.com|grep "has address" |cut -d" " -f1,4
done
