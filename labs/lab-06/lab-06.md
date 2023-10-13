# Lab 06 ⚙️

## Configuring a Static IP Address

### Modify the Interfaces File

- Access the Interfaces file

  `vim /etc/network/interfaces`

- Change the configuration to static. Example:

```
 # The loopback network interface
    auto lo
    iface lo inet loopback

 # The primary network interface
    allow-hotplug enp1s0
    iface enp1s0 inet static
        address 10.0.2.51/24
        gateway 10.0.2.1
```

> Note: Your IP address may vary depending on the IP network you are using. 

For this lab I am setting the Debian Server to work on 10.0.2.51. It is using /24 as the netmask which is equivalent to 255.255.255.0. Also, it is using 10.0.2.1 as the gateway address. 

- Save the file and exit. 

### Deactivate and Reactivate the Network Interface

- Type `ifdown <network_interface>`

  Remember, your system might vary. Based on the previous configuration, we would type:

  `ifdown enp1s0`

  That will deactivate (or "down") the network interface.

- Type `ifup <network_interface>`

  That should apply the static configuration and it should be usable.

### Analyze the Connection
View the current configuration with the `ip a` command. The Debian Server should now have a static IP.

### Test the Connection
Ping your favorite website. For example:

`ping example.com`

Verify that you get replies from the example.com domain. 

👍 **Perfect!**

---

## 📃 Extra Credit
Check out the `ifquery` command. For example:

`ifquery <network_interface>`

This will display the IP address, netmask, and gateway address. 