# Lab 15 ⚙️

## NetworkManager Configuration Files

> IMPORTANT!! It is not recommended to use configuration files. Instead, it is recommended to modify the network configuration using external tools such as **nmcli** or cockpit. 

The configuration files are stored in two locations:
-  /etc/NetworkManager/system-connections  	(keyfile method - preferred)
-  /etc/sysconfig/network-scripts						(older ifcfg method)

### Keyfile Example (INI)

Here's an example of a network configuration file on a Debian client system (meaning one *with* a desktop environment). I accessed it by typing:

`cd /etc/NetworkManager/system-connections`

and opening the configuration file: 

`vim 'Wired connection 1.nmconnection`

Analyze the coniguration below:

```
[connection]
id=Wired connection 1
uuid=89321b95-d3b5-307d-a9f2-ff441c3f61ba
type=ethernet
autoconnect-priority=-999
permissions=
timestamp=1615917585

[ethernet]
mac-address=52:54:00:6D:FB:AC
mac-address-blacklist=

[ipv4]
address1=10.0.2.52/24,10.0.2.1
dns=10.0.2.1;
dns-search=
method=manual

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto
```

Under the *ipv4* section we see the IP address of the system "10.0.2.52/24" followed by the gateway address "10.0.2.1", with the DNS server listed afterward. 

If for some reason the nmcli command, or other external tools, don't work for you, the configuration file can be used, but with caution!!

> Note:
	Changes to a network configuration file on a system that uses NetworkManager require either an `nmcli connection reload` or a system reboot to take effect. 

### ifcfg example

Here's an example of a network configuration file on a CentOS system. This uses the deprecated ifcfg method. 

I accessed it by typing: 
	
`vim /etc/sysconfig/network-scripts/ifcfg-ens3`

Take a look at the configuration below:

```
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens3
UUID=539c56e8-ca22-4b5d-8ecd-cb244d1c24bd
DEVICE=ens3
ONBOOT=yes
IPADDR=172.21.0.222
PREFIX=16
GATEWAY=172.21.0.1
DNS1=172.21.0.1
IPV6_PRIVACY=no
ZONE=public
```

You can see that all of the IP information is listed here. This particular system is on the 172.21.0.0 network and uses the IP address 172.21.0.222. The prefix is 16. That is another name for the netmask (or subnet mask). So the IP address could also be shown as 172.21.0.222/16. 

> IMPORTANT: This is the deprecated method. Stay away!

 👍 **Well done!**

---
