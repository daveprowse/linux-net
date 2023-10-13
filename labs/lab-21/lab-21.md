# Lab 21 ⚙️

## ping Basics

Ping is the most primal testing command. It can show you if your TCP/IP stack is working properly locally. It can tell you if you have access to the default gateway. It can tell you if other systems are "up", or at least, if they are accessible from your location. Here are some examples:
	
**Example**: Pinging the localhost on IPv4
	
```
root@deb52:~# ping -4 127.0.0.1
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.056 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.069 ms
64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.067 ms
^C
--- 127.0.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 52ms
rtt min/avg/max/mdev = 0.056/0.064/0.069/0.005 ms
```

With this command we ping the local system on its IPv4 loopback address: 127.0.0.1. The system received three 64 byte replies before I cancelled the operation by pressing Ctrl + c. You could also ping the localhost by name (for example *deb52*) or via IPv6 which would be ::1

**Example**: Pinging the gateway address
	
```
root@deb52:~# ping 10.0.2.1
PING 10.0.2.1 (10.0.2.1) 56(84) bytes of data.
64 bytes from 10.0.2.1: icmp_seq=1 ttl=64 time=0.126 ms
64 bytes from 10.0.2.1: icmp_seq=2 ttl=64 time=0.236 ms
64 bytes from 10.0.2.1: icmp_seq=3 ttl=64 time=0.226 ms
^C
--- 10.0.2.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 54ms
rtt min/avg/max/mdev = 0.126/0.196/0.236/0.049 ms
```

In this example, we pinged the gateway device which is 10.0.2.1. Notice the difference in the reply time. In the first example, it averaged 0.064 milliseconds (ms), and in the second example, it averaged 0.196 ms - substantially longer (but still quick). That's the difference between pinging the local system (which generated no network traffic) and pinging another system (even though the gateway is just a virtual device). If I was to ping my actual physical gateway, the reply times would average around 0.5 ms. 

**Example**: Pinging a host on the Internet
	
```
root@deb52:~# ping prowse.tech
PING prowse.tech (67.205.11.189) 56(84) bytes of data.
64 bytes from apache2-igloo.allatou.dreamhost.com (67.205.11.189): icmp_seq=1 ttl=49 time=30.7 ms
64 bytes from apache2-igloo.allatou.dreamhost.com (67.205.11.189): icmp_seq=2 ttl=49 time=20.8 ms
64 bytes from apache2-igloo.allatou.dreamhost.com (67.205.11.189): icmp_seq=3 ttl=49 time=20.4 ms
^C
--- prowse.tech ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 6ms
rtt min/avg/max/mdev = 20.406/23.959/30.717/4.780 ms
```
	
In this example, we pinged "prowse.tech". Because the ping was against a name, that name had to be resolved to its IP address (67.205.11.189). Also note that the reply times are much higher, averaging 23.9 ms per reply. Ping rates of 20 - 100 ms are common when connecting to websites. 

 👍 **Fantastic!**
  
 ---

