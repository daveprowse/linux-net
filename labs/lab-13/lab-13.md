# Lab 13 ⚙️

## Working with NetworkManager Tools

There are at least six ways to modify the networking configuration on Linux systems that use NetworkManager. Use a Fedora Workstation or CentOS Workstation to view each of these. (Most of them are also available on other distros such as Debian and Ubuntu clients.)

Let's show four options for configuring via NetworkManager.

- **Settings** - Right-click the desktop and select Settings. Then, locate the Network option. Finally, click the gear in the Wired section. 

<figure>
  <img src="../../images/fedora-network-settings.png" />
  <figcaption>Figure 13-1: Networking Settings on a Fedora Client</figcaption>
</figure>

View all of the tabs on your system. In the figure we start with the Details tab. It shows that our IPv4 address is 10.0.2.55. You can make modifications to the IP settings in the IPv4 and IPv6 tabs. 

- **nm-connection-editor** - Open a terminal and simply type `nm-connection-editor`. This will display a graphical tool that looks quite similar to Settings>Network. 

- **nmtui** - Open a terminal and type `nmtui`. This is the NetworkManager tab-based user interface. It is a menu-driven system that is text only - it can run on a system with or without a desktop environment. 

- **nmcli** - Open a terminal and type `nmcli`. This will show you the networking configuration. The nmcli tool can also be used to modify the configuration either as single commands or within the nmcli shell. This is a popular tool because of its depth, and the fact that you can use it on servers and clients because it runs in the command line only. There will be a segment dedicated to nmcli later in the course.

 👍 **Great work!**

---
