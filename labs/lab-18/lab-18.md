# Lab 18 ⚙️

## Working with **ip address**

- Discover IPv4 and IPv6 addresses. Type `ip a`

	Below are results of the ip a command run on a Debian client:

	```
	root@deb52:~# ip a
	1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
	    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
	    inet 127.0.0.1/8 scope host lo
	       valid_lft forever preferred_lft forever
	    inet6 ::1/128 scope host 
	       valid_lft forever preferred_lft forever
	2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
	    link/ether 52:54:00:6d:fb:ac brd ff:ff:ff:ff:ff:ff
	    inet 10.0.2.52/24 brd 10.0.2.255 scope global noprefixroute enp1s0
	       valid_lft forever preferred_lft forever
	    inet6 fe80::36b4:f533:4478:39c8/64 scope link noprefixroute 
	       valid_lft forever preferred_lft forever
	3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
	    link/ether 52:54:00:69:db:db brd ff:ff:ff:ff:ff:ff
	    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
	       valid_lft forever preferred_lft forever
	4: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast master virbr0 state DOWN group default qlen 1000
	    link/ether 52:54:00:69:db:db brd ff:ff:ff:ff:ff:ff
	```

	Now, in addition to the inforamtion shown with the ip link command, we can see the associated IPv4 and IPv6 addresses. For example, the 2nd interface (*enp1s0) hsa the IPv4 address 10.0.2.52/24. However, this command shows a lot of information. And for a system with a lot of network connections, it can quickly become unmanageable. So, we can sort and filter the information as we see fit. 
	
	For example:

	`ip -br a` 
	
	This makes use of the -br (brief) option. We'll show some more examples of that in the next lab.

 👍 **Great Work!**
 
 ---
