# Lab 20 ⚙️

**Working with the `ip route` command**

- To view the default gateway, type `ip route show` or `ip route` or simply `ip r`. Example:

	```
	root@deb52:~# ip r
	default via 10.0.2.1 dev enp1s0 proto static metric 100 
	10.0.2.0/24 dev enp1s0 proto kernel scope link src 10.0.2.52 metric 100 
	192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 linkdown 
	```

	In the example, the default gateway is shown on the second line as 10.0.2.1. Any networks that this system has access to are also shown. In the example we have 10.0.2.0 and 192.168.122.0. To make columns, simply add the column -t option: `ip r | column -t`. (This is similar to the older `route -n` command if using the net-tools package.) If you have a lot of routes, you can filter for the default gateway easily by typing: `ip r | grep default`.

- Remove and put back the default route (or gateway). 

	In the following example, we use the command `ip r delete default` to remove the default route, then the `ip r` command to check our work, then to put it back: `ip r add default via 10.0.2.1`

	```
	root@deb52:~# ip r delete default
	root@deb52:~# ip r
	10.0.2.0/24 dev enp1s0 proto kernel scope link src 10.0.2.52 metric 100 
	192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 linkdown 
	root@deb52:~# ip r add default via 10.0.2.1
	root@deb52:~# ip r
	default via 10.0.2.1 dev enp1s0 
	10.0.2.0/24 dev enp1s0 proto kernel scope link src 10.0.2.52 metric 100 
	192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 linkdown 
	```

- Add and remove a route.

	To add a new route, use the following syntax: `ip r add <ip_network> dev <interface>`. View the new route with the `ip r` command. 
	
	To remove that route, change "add" to "delete". Example below:

	```
	root@deb51:~# ip r add 172.21.0.0/16 dev enp1s0
	root@deb51:~# ip r
	default via 10.0.2.1 dev enp1s0 onlink 
	10.0.2.0/24 dev enp1s0 proto kernel scope link src 10.0.2.51 
	172.21.0.0/16 dev enp1s0 scope link 
	root@deb51:~# ip r delete 172.21.0.0/16 dev enp1s0
	root@deb51:~# ip r
	default via 10.0.2.1 dev enp1s0 onlink 
	10.0.2.0/24 dev enp1s0 proto kernel scope link src 10.0.2.51 
	```

### Summary 
In this section we covered a good amount of commands. When it comes to knowing commands, its all about practice, and researching the help and man files. The more you practice, the more fluent you become with the command structure. 

> Tip: But remember this! You can't know all commands and all options for each command. It just won't happen. It's more important to know how to search for the information you seek!

We worked with the `ip` command which allows us to analyze Ethernet information, TCP/IP information, routing information, and more. We also worked with ping. Some admins don't like to use the tool, but because it is such an easy and primal tool, and because it just works, it becomes almost inescapable. Ping can be used for basic testing, troubleshooting, and to get a basic baseline of a system.

 👍 **You are on the route to success!!**
 That's right, it will just get nerdier from here on out...
 
 ---

## 📚 Further Study
Remember. Use the following:
- Help file: `ip --help`
- Manual page: `man ip`

And a friendly reminder, if you have questions, contact me!
- [Website](https://prowse.tech)
- [Discord](https://discord.com/invite/mggw8VGzUp)

I'd love to hear from you! 🤍