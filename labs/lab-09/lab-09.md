# Lab 09 ⚙️

## Using Netplan to Configure a Static IP Configuration
Netplan is the front-end utility that is used to configure TCP/IP for Ubuntu Servers. The configuration files are written in YAML. In this lab we show how to view and re-configure Netplan.

### Analyze the netplan configuration
Open the netplan configuration:

For example: `vim /etc/netplan/00-installer-config.yaml`

Here's an example of a netplan .yaml file in Ubuntu server:

```yaml
network:
  ethernets:
    ens3:
      addresses:
        - 10.0.2.53/24
      routes:
        - to: default
          via: 10.0.2.1
      nameservers:
        addresses:
          - 10.0.2.1
  version: 2
  renderer: networkd
```
  
Take a minute to analyze your configuration.

The network interface name is *enp1s0*. The IP address of the server is 10.0.2.53. The gateway and DNS server IPs are one and the same: 10.0.2.1. 

> Note: You can also use square brackets for some of the IP addresses. By doing so, you can easily add IP addresses, by comma-separating them. For example: 

`[10.0.2.53/24,10.0.2.158/24]` 

> Note: You might not see the *renderer* line item. This allows you to change the base network service that the system uses. For example, if NetworkManager was installed to the Ubuntu Server and we wanted to use it as our primary network service, we could change the setting from *networkd* to *NetworkManager* and then Netplan would interface with that instead.

### Modify the netplan Configuration

If your configuration shows DHCP, then modify it to a static address, similar to the configuration above, but based on your IP network. Otherwise, change the IP address to something different, for example, from .53 to .153. Then, save and quit out of your text editor.

You can have netplan check your configuration by typing `netplan try`. 

If there are no error messages, proceed by saving the configuration: `netplan apply` 

Then test it with `ping example.com`

👍 **Nicely done**

---

## 📚 Further Study
Learn more about Netplan: https://netplan.readthedocs.io/en/stable/

YAML (YAML Ain't Markup Language) is another important tool. Read up on it at this link: https://yaml.org/ 
