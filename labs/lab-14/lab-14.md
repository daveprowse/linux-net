# Lab 14 ⚙️

## Using Cockpit

Cockpit is a program that can be run on a server allowing admins to analyze and configure the server from a remote system via a web browser. It can be installed on most Linux distributions but is included in Fedora/RHEL/CentOS by default (though it might not be enabled and started). A Fedora server and a Linux client with a browser are recommended for this lab.

- **Enable and start the Cockpit service** - Type the following command to enable and start cockpit.
	`systemctl --now enable cockpit.socket`

- **Verify that it is running** 
	`systemctl status cockpit.socket`

- **Connect from a remote system** - Configure the server from a Linux workstation with a desktop environment. Open a browser and connect to https://ip_address:9090. Where *ip_address* is the IP address of your server that you enabled cockpit on. For example, type: 

	`https://10.0.2.54:9090`

	That should connect to the server. You may have to accept the security risk to continue, and then you will need to login to the server using the same credentials you have been using so far. After that, click "Networking" on the left-hand side. That wil display all of the networking information for the system.

	<figure>
  <img src="../../images/fedora-cockpit.png" />
  <figcaption>Figure 14-1: Browser-based usage of Cockpit controlling a Fedora Server</figcaption>
</figure>

 👍 **Great work!**

---
