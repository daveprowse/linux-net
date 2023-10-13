# Lab 07 ⚙️

## Configuring DNS in Debian Server

### Verify the DNS configuration

Most likely, the DNS configuration is correct. But we should check it anyway, and then test it.

- Analyze the DNS configuration:

    `cat /etc/resolv.conf`

    This should show an IP address of a DNS server. 
    
    For example, my Debian server shows the DNS server IP as 10.0.2.1. That is the IP address of the built in DNS forwarder in the virtualization system (it is the same as the gateway address). 
    
    In some cases you might have to modify the address to something else - for example, the IP address of the router on your network, or some other device's address on the LAN. But if you are using a virtualization system (VirtualBox, Vmware, Hyper-V, KVM, etc...) then the DNS forwarder should be the first IP on your computer's IP network. 
    
    So for example, the Debian server above is on the 10.0.2.0 network. It has an IP of 10.0.2.51 and uses the virtualization system's IP of 10.0.2.1 for DNS and the gateway.

- Test if DNS is resolving properly:

    `ping example.com`

    This should translate the name *prowse.tech* to its current IP address. For example:
    ```
    root@debserver:~# ping example.com
    PING example.com (93.184.216.34) 56(84) bytes of data.
    64 bytes from 93.184.216.34 (93.184.216.34): icmp_seq=1 ttl=58 time=10.7 ms
    64 bytes from 93.184.216.34 (93.184.216.34): icmp_seq=2 ttl=58 time=9.93 ms
    64 bytes from 93.184.216.34 (93.184.216.34): icmp_seq=3 ttl=58 time=10.7 ms
    ^C
    --- example.com ping statistics ---
    6 packets transmitted, 6 received, 0% packet loss, time 9035ms
    rtt min/avg/max/mdev = 9.932/10.522/10.868/0.301 ms
    ``````

  Here we see that example.com is being translated (or *resolved*) to the IP address 93.184.216.34. Also, we are receiving replies. This is what you want so that you can connect properly to the Internet.

### Modify the DNS Address

- Access the resolv.conf file

  `vim /etc/resolv.conf`

  > Note the spelling of "resolv". It is correct!

- Change the configuration so that the DNS server our system reports to is 8.8.8.8. (Or your favorite DNS server)
- Save the file
- Down and up the network interface (`ifdown` and `ifup`)

### Test the New DNS Configuration
Be sure to ping a domain (such as example.com) to verify that DNS is working properly. 

### Return the Configuration to the Original
- Go back to `/etc/resolv.conf` and change the DNS server IP back to the original configuration. 
- Restart the Debian Server when you are done. 
- Verify that everything functions properly.

👍 **That was AWESOME! That closes out the Debian labs---for now!**

---

## 📚 Further Study
For more information on Debian networking (for Debian servers with no GUI) then see this link:

https://wiki.debian.org/NetworkConfiguration