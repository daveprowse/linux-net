# SuperPing!

*Dave Prowse*

https://prowse.tech

Superping is a script I made to allow for the pinging of multiple hosts in one procedure. 
There are two versions:
- superping.sh - this runs as a script in the background and writes the results of the ping to two files: replies.txt and noreplies.txt. It is currently set to append to the files (and create new ones if they don't exist).
- superping-terminal.sh - this runs in the terminal and gives you results as standard output in the terminal. It does not write to any files. 
Both of these versions call on computers.txt to find out the list of systems to ping. Modify that file as you see fit, based on your systems and network. 

** This script is designed for educational purposes only. 
