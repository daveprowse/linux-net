# Lab 01 ⚙️

## Use the `ip a` command

Welcome to your first lab! Remember, these lab documents are designed to accompany the corresponding videos in the *Linux Networking - Basics and Beyond* video course.

> Note: This is the only lab for this lesson.

In the console (or terminal) type the `ip a` command and view the results. Here's an example on a Debian server:

```
root@deb51:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:f0:2b:b4 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.51/24 brd 10.0.2.255 scope global enp1s0
       valid_lft forever preferred_lft forever
    inet6 fe80::5054:ff:fef0:2bb4/64 scope link 
       valid_lft forever preferred_lft forever
3: enp7s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 52:54:00:0a:2a:c9 brd ff:ff:ff:ff:ff:ff
```

This shows two interfaces: 

1. *lo*, which is the local loopback, something that is found by default on every system that runs TCP/IP. "inet" shows the IPv4 address, which for *lo* is 127.0.0.1.
2. *enp1s0*, which is the main network interface, used to access other systems and the Internet. The IPv4 address is 10.0.2.51.

> Note:
	For help with the ip command type `ip --help`, and for more in-depth information, see the manual page `man ip`. 

*That was an easy lab, but don't worry, we're going to raise the complexity level soon! Great work so far!*

---

## (Optional) Additional Study for this Lesson
- [The ip command (deep-dive)](https://prowse.tech/deep-dive-the-ip-command-in-linux/)
- [Building Linux Servers - DHCP, DNS, and Directory Services](https://www.oreilly.com/videos/building-linux-servers/9780137368495/)

- **Instructor Network Map with IP Scheme**
![Instructor Network Map with IP Scheme](/images/instructor-network-map-with-ip-scheme.png)