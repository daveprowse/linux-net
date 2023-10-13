# Lab 27 ⚙️

## Modifying Static IP Connections with nmcli

### Add an IP address with nmcli
Example

```
nmcli connection modify "Wired connection 1" ipv4.method manual ipv4.address 10.0.2.152/24 ipv4.gateway 10.0.2.1 ipv4.dns 10.0.2.1
```

In this example, we specify that the address to be added will be static, then we add the IP address 10.0.2.152/24, and then we add the gateway and DNS IP addresses. You can add multiple IPs if you needed to in this manner, just by comma separating them:

```
nmcli connection modify "Wired connection 1" ipv4.method manual ipv4.address 10.0.2.152/24,10.0.2.153/24
```

> Note:	You can abbreviate here too, for example: `nmcli con mod` or even `nmcli c m` instead of `nmcli connection modify`. 

> Combine this with tab completion. For example, for the network interface type `"W` and press the tab key. That will auto-complete the name of the interface, which in this case is "Wired connection 1". Combine auto-complete with abbreviations and it can be a real time-saver. Wonderful!

### Deactivate and Activate the interface

Once you have made your changes, you need to deactivate and reactivate the network interface for the changes to take effect. This is known as "down" and "up" the interface. To do this type the following two commands:

`nmcli connection down "Wired connection 1"`

and

`nmcli connection up "Wired connection 1"`

> Note: As always, abbreviate. For example: `nmcli c d <network_interface>`

At this point you should see the new IP addresses listed when you run the `nmcli` command. The following example shows a snippet of the nmcli results. 

```
enp1s0: connected to Wired connection 1
"Red Hat Virtio"
ethernet (virtio_net), 52:54:00:6D:FB:AC, hw, mtu 1500
ip4 default
inet4 10.0.2.152/24
inet4 10.0.2.153/24
route4 10.0.2.0/24
```

You can see the two IP addresses that were added previously.

👍 **MEGA_AWESOME**
  
---
