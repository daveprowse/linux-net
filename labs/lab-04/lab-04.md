# Lab 04 ⚙️

## Configuring a Dynamic Address

### View the Network Configuration File

It is located at: /etc/networking/interfaces

> Example:
    Here's an example of the interfaces file in Debian. You can use Debian's built-in text editor: Nano, but I prefer Vim. To install Vim, type `apt install vim`. 

    ```
    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    allow-hotplug enp1s0
    iface enp1s0 inet static
        address 10.0.2.51/24
        gateway 10.0.2.1
    ```

This example shows a static IP configuration.	Take a few minutes to read the configuration.
	
> Note: If you configured your system to obtain an IP address during the installation of Debian, then it would show "dhcp" instead of "static", and there would be no address or gateway entries. 

### Configure a Dynamic Address

> Note: In the videos I use Vim. You are free to choose whichever editor you like, but if you would like a demonstration of Vim, see [this link](https://prowse.tech/vim/).

- Remove the last two lines (if they are there). That includes the "address" and "gateway" lines.
- Replace "static" with "dhcp". It should look similar to the following:
  ```
	# The primary network interface
    allow-hotplug enp1s0
    iface enp1s0 inet dhcp
	```

- Save and quit out of the file.

### View the Current Configuration
Type `ip a` to view the current config. 

You will note that the IP address has not changed yet. That is because we have not deactivated and reactivated the network interface yet. We'll do that in the following lab!

👍 **Great work!**

---
