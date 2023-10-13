# Lab 19 ⚙️

## Advanced **ip a**

### Sorting and Filtering
You can modify how the results of the **ip a** command are displayed. Let's show some examples. 

- Sort and filter using the ip command

	Example 1:  `ip -br a`

		```
		root@deb52:~# ip -br a
		lo               UNKNOWN        127.0.0.1/8 ::1/128 
		enp1s0           UP             10.0.2.52/24 fe80::36b4:f533:4478:39c8/64 
		virbr0           DOWN           192.168.122.1/24 
		virbr0-nic       DOWN        
		```

	With this command we get a nice table of information telling us the state of the interface and the IP addresses. I use it often!

	> Note: Add the `-c` option for color!

	Example 2:  `ip a | grep inet | sort -n`

		```
		root@deb52:~# ip a | grep inet | sort -n
		    inet 10.0.2.52/24 brd 10.0.2.255 scope global noprefixroute enp1s0
		    inet 127.0.0.1/8 scope host lo
		    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
		    inet6 ::1/128 scope host 
		    inet6 fe80::36b4:f533:4478:39c8/64 scope link noprefixroute 
		```
		
	With this command we filter for the term "inet" and sort the results numerically. You could also add a "column -t" to make a nice table out of it. 

	Example 3:  `ip --oneline addr | column -t`
		
   ```
		root@deb52:~# ip --oneline addr | column -t
		1:  lo      inet   127.0.0.1/8                   scope  host             lo\            valid_lft  forever        preferred_lft  forever
		1:  lo      inet6  ::1/128                       scope  host             \              valid_lft  forever        preferred_lft  forever
		2:  enp1s0  inet   10.0.2.52/24                  brd    10.0.2.255       scope          global     noprefixroute  enp1s0\        valid_lft      forever        preferred_lft  forever
		2:  enp1s0  inet6  fe80::36b4:f533:4478:39c8/64  scope  link             noprefixroute  \          valid_lft      forever        preferred_lft  forever
		3:  virbr0  inet   192.168.122.1/24              brd    192.168.122.255  scope          global     virbr0\        valid_lft      forever        preferred_lft  forever
	```
	
	With this command we show each IPv4 and IPv6 interface as one line of information. 

	You can imagine the possibilities when it comes to a command like ip. Search for, and practice with different options to make your work more efficient, and easier on the eyes. 

### Adding and removing IP addresses with the ip command

- To add an IP address, use the following syntax: `ip a add <ip_address> dev <interface>`. So for example:

	`ip a add 10.0.2.152/24 dev enp1s0`

	This would add the IP address 10.0.2.152 to the interface named *enp1s0*. However, this is meant for temporary purposes. If you need a persistent change then another tool is recommended, for example, nmcli.

- To remove an IP address, simple change *add* to *delete*. For example:

	`ip a delete 10.0.2.152/24 dev enp1s0`

 👍 **Now you're cooking!**
 
 ---
