# Lab 28 ⚙️

## Configuring a DHCP Network Connection with nmcli
> Note: You will need a working DHCP server that your client can access for this lab. 

### Use nmcli to obtain an IP address automatically from a DHCP server.

Type the following command:

`nmcli c m <network_interface> ipv4.method auto`

By selecting "auto" we set the interface to obtain all TCP/IP information from a DHCP server (if one is available) including it's IP address, netmask, gateway address, and DNS server IP address. Down and up the interface for the changes to take effect. You should see something similar to the example snippet below:

```
enp1s0: connected to Wired connection 1
"Red Hat Virtio"
ethernet (virtio_net), 52:54:00:6D:FB:AC, hw, mtu 1500
ip4 default
inet4 10.0.2.152/24
inet4 10.0.2.153/24
inet4 10.0.2.139/24
route4 10.0.2.0/24
```

In this case, the system obtained an IP address from a DHCP server on my virtual network. It received the address 10.0.2.139. Now we have two static IP addresses and one dynamic IP address!

### Remove one of the static IP addresses we had added in the previous sub-lesson.

Type the following command:

`nmcli c m "Wired connection 1" -ipv4.address 10.0.2.153/24` 

Note the - dash before ipv4, and type in an appropriate IP address based on your configuration. Down and up the interface and you should see the results with the `nmcli`` command. 

👍 **Fantastic!**
  
---
