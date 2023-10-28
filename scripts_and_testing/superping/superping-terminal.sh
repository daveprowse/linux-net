#!/bin/bash
# superping for Linux - writes to the terminal
echo
date
cat computers.txt | while read systemname
do
	ping -c 1 "$systemname"> /dev/null
	if [ $? -eq 0 ]; then
	echo "$systemname is alive"
	else
	echo "$systemname is dead"
	fi
done