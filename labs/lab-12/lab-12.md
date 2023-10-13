# Lab 12 ⚙️

## Analyzing the NetworkManager Service

The NetworkManager service is probably the most commonly used networking service in Linux. It is the default on RHEL/Fedora/CentOS, and is used by default on Debian (as a client), Ubuntu Desktop, and many more Linux distributions. 

- View the status of the service:

	`systemctl status NetworkManager`

  Take a couple of minutes to analyze the results of this command. 

- Turn off the service:

	`systemctl stop NetworkManager`

- Test the network connection: 

	`ping example.com`

- Enable and start the service with one command:

	`systemctl --now enable NetworkManager`

- Test the network connection again to make sure it works. 

 👍 **We're just scratching the surface. Keep going!**

---
