# Lab 17 ⚙️

## Working with **ip link**

- Find out Ethernet-based information. Type `ip link`

	Below are results of the ip link command run on a Debian client:

	```
	root@deb52:~# ip link
	1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
	    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
	2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
	    link/ether 52:54:00:6d:fb:ac brd ff:ff:ff:ff:ff:ff
	3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
	    link/ether 52:54:00:69:db:db brd ff:ff:ff:ff:ff:ff
	4: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast master virbr0 state DOWN mode DEFAULT group default qlen 1000
	    link/ether 52:54:00:69:db:db brd ff:ff:ff:ff:ff:ff
	```

	From this list we can see the ethernet-based information of each network connection on the system. For example, the 2nd connection *enp1s0* has a MAC address of 52:54:00:6d:fb:ac. The MAC address is normally 6 octets and is colon-separated. This address is burned into the PROM chip of the network interface, or (in the case of virtual machines) it is assigned to a virtual network interface. We also see that *enp1s0* is "UP", meaning that it is activated and ready to transmit and receive data.  

 👍 **The journey with ip has begun!**
 
 ---

## 📚 Further Study
> Remember: If you need more information about any command, to use the help file (for example `ip --help`, or simply `ip -h`) or the manual page (for example `man ip`). Use the help and manual pages for any command that you need more information about. 