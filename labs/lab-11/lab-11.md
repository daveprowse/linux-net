# Lab 11 ⚙️

## Additional networkd-based Commands

- Use the `networkctl` command to find the available network interfaces. Here's an example of an Ubuntu Server's interfaces:

```
root@ubuntu-server:~# networkctl
IDX LINK   TYPE     OPERATIONAL SETUP     
  1 lo     loopback carrier     unmanaged 
  2 enp1s0 ether    routable    configured

2 links listed.
```

Here you can see that the system has the local loopback (like any Linux system by default), and the *enp1s0* Ethernet network interface. 

- Use the `networkctl status` command to see the status of networkd-based interfaces. Here's an example of the results of that command.

```
root@ubuntu-server:~# networkctl status
           State: routable                         
         Address: 10.0.2.53 on enp1s0              
                  fe80::5054:ff:febc:b314 on enp1s0
         Gateway: 10.0.2.1 on enp1s0               
             DNS: 10.0.2.1                         
  Search Domains: example.com                      

Mar 30 14:41:36 ubuntu-server systemd[1]: Starting Network Service...
Mar 30 14:41:36 ubuntu-server systemd-networkd[682]: Enumeration completed
Mar 30 14:41:36 ubuntu-server systemd[1]: Started Network Service.
Mar 30 14:41:36 ubuntu-server systemd-networkd[682]: enp1s0: IPv6 successfully enabled
Mar 30 14:41:36 ubuntu-server systemd-networkd[682]: enp1s0: Link UP
Mar 30 14:41:36 ubuntu-server systemd[1]: Starting Wait for Network to be Configured...
Mar 30 14:41:36 ubuntu-server systemd-networkd[682]: enp1s0: Gained carrier
Mar 30 14:41:37 ubuntu-server systemd-networkd[682]: enp1s0: Gained IPv6LL
Mar 30 14:41:37 ubuntu-server systemd[1]: Finished Wait for Network to be Configured.
```

As you can see, the state of the connection is "routable" which means that this system can connect out to other systems and beyond to other networks (if available). The command also shows the IP address of the *enp1s0* network interface, as well as the DNS and gateway IP addresses. The command also displays the status of the systemd-networkd service, which is started. 
 
👍 **You're doing great! Keep Going!**

---

## 📚 Further Study
> For more information, see the following links:
    
  Netplan Configurations: https://netplan.io/examples
     
  networkd on Debian: https://wiki.debian.org/SystemdNetworkd
