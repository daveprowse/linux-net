# Lab 30 ⚙️

## Installing and Analyzing SSH on Linux

As often mentioned, sysadmins *live* in the command line. It's all about controlling systems remotely and moving files via the command line. There are plenty of tools available to accomplish these tasks. In this lab we cover SSH.

### SSH
The Secure Shell (or SSH) is used  to remotely control another system from the command line. It involves a 4-step process. 

1. Client initiates a connection to an SSH “server”
2. Server sends out a public key
3. The two handshake on parameters and open a secure channel
4. The user at the client logs in to the server

There are a variety of SSH tools including PuTTY, WinSCP, CyberDuck, and so on. However, OpenSSH is built-in to most Linux Distributions and can be installed or updated as necessary. That’s what we will focus on during this webinar.

### Verify SSH
Let's verify whether SSH is running as a server, and connect from one machine to another using SSH.

- Verify if SSH is available on the target computer.

	Use the command `ssh -V` to see if SSH is installed. You should see the current version.

	If it is not installed, you can install it, for example:

	`apt install openssh-server`

	Replace "apt" with whatever package manager your distribution uses. 

- Check if the OpenSSH server service is running.

	In most instances, OpenSSH uses two services: ssh (for the client) and sshd (for the server). We are interested in the server service on the target computer. To see if the server service is running, type the command:

	`systemctl status ssh`
	
	You should see something similar to the following:

	```bash
	user@deb52:~$ systemctl status ssh
	● ssh.service - OpenBSD Secure Shell server
	   Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
	   Active: active (running) since Thu 2021-04-01 15:03:17 EDT; 9h ago
	     Docs: man:sshd(8)
		   man:sshd_config(5)
	  Process: 513 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
	 Main PID: 542 (sshd)
	    Tasks: 1 (limit: 4685)
	   Memory: 6.6M
	   CGroup: /system.slice/ssh.service
		   └─542 /usr/sbin/sshd -D
	```

  > Note: Previously, you would have listed the service as "sshd", but that is deprecated on newer versions of Linux, and "ssh" is fine.

	If it is not active and running, you can enable and start it by typing:

	`systemctl --now enable ssh`

	> Note: Make sure the service is active and running on the target computer, or you won't be able to "SSH" into that system to take control of it.

### Check network ports

You can also check the ports of the target system with the following command:

`ss-tun`

This will show multiple results. The one you are looking for includes the 0.0.0.0 IP address of the system and port 22. This means that the system is running SSH as a server and is listening for incoming connections

For example:

```
LISTEN              0                   128                                    0.0.0.0:22
```

At this point, the OpenSSH server should be ready to accept connections. 

👍 **This is getting good.**
  
---

