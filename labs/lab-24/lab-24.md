# Lab 24 ⚙️

## Configuring a Hostname in the Terminal

We've done plenty up to this point with IP addresses. But most systems (and people) communicate by name. So a technician needs to know how to modify hostnames and configure DNS. Remember that the Domain Name System (DNS) is in charge of resolving domain names (and host names) to their respective IP addresses - and vice-versa. 

### Working with `hostnamectl`

- View system information with the `hostnamectl` command

	Type `hostnamectl` to see the hostname and other information about the system. Example:

	```
	root@deb52:~# hostnamectl
	  Static hostname: deb52
	        Icon name: computer-vm
	          Chassis: vm
	         Location: workplace2
	       Machine ID: 42f779dc9123405c90f8fa73b6c83f7c
	          Boot ID: 35b9c976794a4bb38ba7a4e81511152a
	   Virtualization: kvm
	 Operating System: Debian GNU/Linux 10 (buster)
	           Kernel: Linux 4.19.0-16-amd64
	     Architecture: x86-64
	```

	Here we see the name of the computer is *deb52*. We get a whole lot of other information as well, including the operating system type and version, the version of the Linux kernel, and the architecture of the computer. 

- Use the `hostnamectl` command to change the hostname. 
	- First, change the name by typing `hostnamectl set-hostname newname`
	- View the new name by entering `hostnamectl`
	- Close the terminal and open a new one to see the new name in the prompt.
	- Change the name back to the original.
	- Close the terminal and open a new one again.
	- Verify the name is back to the original. (You can also use the older `hostname` command to see the hostname only.)

	Example: (the four dashes represents closing the terminal and reopening it)

	```
	root@deb52:~# hostnamectl set-hostname newname
	root@deb52:~# hostnamectl
	   Static hostname: newname
	         Icon name: computer-vm
	           Chassis: vm
	          Location: workplace2
	        Machine ID: 42f779dc9123405c90f8fa73b6c83f7c
	           Boot ID: 35b9c976794a4bb38ba7a4e81511152a
	    Virtualization: kvm
	  Operating System: Debian GNU/Linux 10 (buster)
	            Kernel: Linux 4.19.0-16-amd64
	      Architecture: x86-64
	----
	root@newname:~# hostnamectl set-hostname deb52
	----
	root@deb52:~# hostname
	deb52
	```

	> Note: A fun program that shows similar information to hostnamectl is called neofetch. Install it by name with your distro's installer - for example `apt install neofetch`. Then run the program by simply typing `neofetch`. 

👍 **Excellent work!**
  
---

## 📚 Further Study
Be sure to check the help file and manual page for `hostnamectl`
- `hostnamectl -h`
- `man hostnamectl`