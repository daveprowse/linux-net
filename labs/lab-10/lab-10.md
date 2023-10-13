# Lab 10 ⚙️

## Examining Dynamic and Wireless IP Configurations

### Dynamic IP
Sometimes, the Ubuntu Server will require a dynamically obtained address. Here's an example of a Netplan file that calls for DHCP.

```yaml
network: 
 ethernets:
   enp3s0:
     dhcp4: true
```

In this case, all TCP/IP details will be obtained from the DHCP server including the IP address, gateway address, DNS server address, and anything else that might be part of the DHCP configuration. 

**Try it!**

To set your Ubuntu Server to obtain an IP address automatically from a DHCP server, do the following:
- Go to /etc/netplan
- Backup the configuration file that is there. For example: `cp 00-<config_file> 00-<config-file>.bak`
- Modify the original configuration file similar to the previous example. 
- Run a `netplan try` to see if the configuration will be accepted.
- Test it with `ping example.com`
- Return it back to normal by:
  - Deleting the original configuration file `rm <netplan_file>`
  - Renaming the backup to the original name 
  - Running `netplan try` again.
  - Test as always!

### Wireless IP 
In some cases you may want to have a wireless connection on your Ubuntu Server. If so, a typical wireless configuration in Netplan will look like this:

```yaml
network:  
  wifis:
    wlp2s0b1:
      dhcp4: true
      access-points:
        "network_ssid_name":
          password: "**********"
```

> Note: The file name for this configuration might be something similar to *wpa-enp0s35a4*. 

> Note: One of the security issues here is that the password for the WAP shows up in plain text. There are various ways to mask this though. Also, cryptographic hashing should be used.

Remember, the bulk of Ubuntu Servers will use wired connections.

👍 **Excellent ^**

---
