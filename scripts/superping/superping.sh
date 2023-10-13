#!/bin/bash
# superping for Linux - writes ping results to log files in current directory
# modify computers.txt to suit your network and systems

clear -x
start=$SECONDS
printf "\n\033[7;31mTEST IN PROGRESS......\033[0m\n\n"
printf "Test started by %s on %s \n\n" "$USER" "$(date)" >> replies.txt
printf "Test started by %s on %s \n\n" "$USER" "$(date)" >> noreplies.txt
cat computers.txt | while read -r systemname
do
	ping -c 1 "$systemname" > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
	printf "%s is alive\n" "$systemname" >> replies.txt
	else
	printf "%s is dead\n"  "$systemname" >> noreplies.txt
	fi
done
printf "\nTest completed at %s \nEND of LOG\n-----\n\n" "$(date +%r)" >> replies.txt
printf "\nTest completed at %s \nEND of LOG\n-----\n\n" "$(date +%r)" >> noreplies.txt
printf "\n\033[7;32mTEST COMPLETE! \033[0m"
printf "\nTime to complete = %s seconds" "$SECONDS"
printf "\nSee replies.txt and noreplies.txt for details.\033[0m\n\n"
