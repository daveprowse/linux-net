# Lab 22 ⚙️

## Advanced ping

Example: Modifying the ping packet size and amount of replies

```
root@deb52:~# ping -c 5 -s 1024 10.0.2.1
PING 10.0.2.1 (10.0.2.1) 1024(1052) bytes of data.
1032 bytes from 10.0.2.1: icmp_seq=1 ttl=64 time=0.136 ms
1032 bytes from 10.0.2.1: icmp_seq=2 ttl=64 time=0.226 ms
1032 bytes from 10.0.2.1: icmp_seq=3 ttl=64 time=0.219 ms
1032 bytes from 10.0.2.1: icmp_seq=4 ttl=64 time=0.210 ms
1032 bytes from 10.0.2.1: icmp_seq=5 ttl=64 time=0.232 ms

--- 10.0.2.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 102ms
rtt min/avg/max/mdev = 0.136/0.204/0.232/0.038 ms
```

This time we added two options. `-c (count)` specifies the exact amount of ping requests (and hopefully, replies) - in this case I selected 5. You can see that I didn't have to press Ctrl + c to break out of the ping process. `-s (packetsize)` allows you to change the ICMP echo - I changed it from the default 64 bytes to 1024 bytes. The replies add 8 bytes of supervisory information, bringing it to 1032 bytes per reply packet. 

This type of ping modification can be helpful when testing servers and attempting to simulate more traffic, or conducting longer tests with a specific amount of pings. The maximum packet size on most versions of Linux is 65507 bytes, which creates fragmented information, and could be blocked by a security device, so the maximum recommended testing amount is around 1400 bytes. (This keeps it within the realm of normal 1500 byte IP packets).  

👍 **Just think of it as a nice game of ping pong!**
  
---

## 📚 Further Study
Check out the superping script that I provided in the /scripts directory of this repo. It's fun!