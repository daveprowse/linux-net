# Lab 29 ⚙️

## Editing Network Connections with the nmcli Shell
You can access the nmcli interactive shell for any one of your network interfaces. Once there, you can run multiple commands, and save them all at once. 

### Access the nmcli shell
To access the nmcli shell for an interface enter the following:

`nmcli connection edit "Wired connection 1"`

Note that it says "edit" this time. That is the option that opens a shell. Remember to change the interface name based on your system. You should see something similar to the following:

```
root@deb52:~# nmcli connection edit "Wired connection 1" 

===| nmcli interactive connection editor |===

Editing existing '802-3-ethernet' connection: 'Wired connection 1'

Type 'help' or '?' for available commands.
Type 'print' to show all the connection properties.
Type 'describe [<setting>.<prop>]' for detailed property description.

You may edit the following settings: connection, 802-3-ethernet (ethernet), 802-1x, dcb, sriov, ethtool, match, ipv4, ipv6, tc, proxy
nmcli> 
```

Now, we can enter commands into the shell. 

### Remove the other static IP address

In the shell, type the following command

`remove ipv4.address 10.0.2.152/24` 

This will remove the static IP address. 

### Set a new static IP address

Type `set ipv4.address 10.0.2.52/24`. This will set the original IP address that the system had before. If it asks, type "yes" to set the IP address to manual. 

> Note: You can also abbreviate here. Instead of "remove" type "r", and instead of "set", type "s". Every character counts!

### Save the configuration, activate it, and quit

To save the configuration, simply type `save`. Then type `activate` to enable it. Finally, type `quit` to exit out of the shell.  At this point, our IP configuration should be back to what it was when we started the lesson. 

The beauty of the nmcli shell is that we can do multiple operations like this without having to type "nmcli" every time, or specifying the network interface everytime, because the shell we opened is dedicated to the interface we specified in the beginning. 

### nmcli Summary
The `nmcli` command is extremely powerful and well-versed. You can analyze systems, change TCP/IP information, work with it as a single command or in an interactive shell. One look at the MAN page shows you the depth of the command. That's one of those commands that requires a lot of practice to master - everyday. 

So that wraps up this part. Remember to practice the commands and options, but also, to know how to search for the commands and options that you need to get your work done quickly and efficiently. 

👍 **You rule! Keep going!**
  
---

## 📚 Further Study
For more information about nmcli use the `nmcli -h` and `man nmcli` commands. Also consider `man nmcli-examples`

Also, see the following link:

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli