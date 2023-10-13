# Lab 26 ⚙️

## Using nmcli to Analyze Network Connections
**nmcli** is the NetworkManager command-line interface. This is a very commonly used command line tool for analyzing, modifying, and troubleshooting network connections. It is used by Fedora/RHEL/CentOS, Debian (as a client) Ubuntu Desktop, and many more Linux distributions. It can be used as a single-command tool or within an interactive interface. We'll start with the nmcli command in the command line. Keep in mind - this command is boss!

### Basic usage of nmcli

Type `nmcli` to see your network configuration. Example results on a Debian client are below. Results on other systems running NetworkManager should be very similar. 

Example of the `nmcli` command on a Debian client
	
```
enp1s0: connected to Wired connection 1
"Red Hat Virtio"
ethernet (virtio_net), 52:54:00:6D:FB:AC, hw, mtu 1500
ip4 default
inet4 10.0.2.52/24
route4 10.0.2.0/24
route4 0.0.0.0/0
inet6 fe80::36b4:f533:4478:39c8/64
route6 fe80::/64

virbr0: connected to virbr0
"virbr0"
bridge, 52:54:00:69:DB:DB, sw, mtu 1500
inet4 192.168.122.1/24
route4 192.168.122.0/24

lo: unmanaged
"lo"
loopback (unknown), 00:00:00:00:00:00, sw, mtu 65536

virbr0-nic: unmanaged
"virbr0-nic"
tun, 52:54:00:69:DB:DB, sw, mtu 1500

DNS configuration:
servers: 10.0.2.1
interface: enp1s0

Use "nmcli device show" to get complete information about known devices and
"nmcli connection show" to get an overview on active connection profiles.

Consult nmcli(1) and nmcli-examples(5) manual pages for complete usage details.
```

At the beginning of the results we see "enp1s0: connected to "Wired connection 1". *enp1s0* is the Linux hardware-based name for the network interface. But NetworkManager gives these devices its own names - in this case, *Wired connection 1*. That is the name that we need to use when configuring the network interface with the nmcli command. Lets show how to add and remove static and DHCP-based IP addresses. 

### View the NetworkManager connections

Type `nmcli connection show`. Here's an example:

```
[sysadmin@smauggy ~]$ nmcli connection show
NAME                UUID                                  TYPE      DEVICE 
Wired connection 1  58f4b9c3-638d-31e4-bdbf-010a3b56bf47  ethernet  enp3s0 
EMF-5B              257a1403-e9fd-4a05-bb5c-e91f7baf5274  wifi      wlp2s0 
virbr0              12a61b1b-f6c6-42a1-b62c-7777cfb94763  bridge    virbr0 
```

This example was taken from an actual laptop with wired and wireless connections. Under the "TYPE" column you can see there is an "ethernet" device named *enp3s0*. That is the wired connection, and so NetworkManager calls is "Wired connection 1". Under "TYPE" you will also see a "wifi" device named *wlp2s0*. In this case, NetworkManager refers to it by the name "EMF-5B" (which is actually the name of the wireless network it is connect too - a bit of a security issue, but one which is fixable).

> Note: You can abbreviate (or truncate) nmcli commands a lot. For example, `nmcli connection show` can be reduced to `nmcli con show`, or just `nmcli c s`. In fact, the "show" portion isn't even necessary. So you could just type `nmcli c` and be done with it! You'll get the same results.


👍 **Excellent work! Keep it up!**
  
---
