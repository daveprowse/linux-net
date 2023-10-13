# Lab 31 ⚙️

## Using SSH to Connect to a Remote System

Now we can connect to our "server" using the SSH command from a client computer. In this lab I use a Fedora system to connect to the Debian system that is acting as the OpenSSH server. The standard command looks like this:

`ssh user@10.0.2.51`

`ssh` is the command. `user` is the account on the target system that you will use to control it. `10.0.2.51` is the target IP address that we are connecting to. That is the typical syntax when working with SSH. Of course, your usernames and IPs may be different.

> Note:	If you are using VirtualBox for your virtual machines, the typical SSH syntax probably won't work. You either need to set up some sort of routing, or configure port forwarding in VirtualBox (preferred). When you connect in this manner, the typical syntax looks similar to this:

	`ssh user@127.0.0.1 -p 2222`

> Note: For more information on VirtualBox port forwarding, see [this link](https://prowse.tech/virtualbox/). 

At this point, we should be able to control the target computer, based on the user account's permissions. The figure below shows a Fedora system (named *fed-client*) that has SSH'd into the Debian system (named *deb52*). After logging in with SSH as the user account, I then logged in as root by typing `su -` and the password for the root account on the Debian system. 

<figure>
	<img src="../../images/ssh-fed-deb.png" />
	<figcaption>Figure 4-1: Connecting from a Fedora system to a Debian system with SSH</figcaption>
</figure>

> Warning! In the field it is recommended to avoid the use of the root account whenever possible. The use of root access in these labs is for educational purposes only. 

When finished, we can log out of the SSH session by typing `exit` or by pressing Ctrl + D on the keyboard.

👍 **Nicely Done!**
  
---

