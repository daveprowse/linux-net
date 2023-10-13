# Lab 05 ⚙️

## The DORA Process

### Deactivate and Reactivate the Network Interface

- Type `ifdown <network_interface>` in the terminal.

  For example: `ifdown enp1s0`. Your system may vary.

  > Note: Is use alligators < > to state there will be a variable.

  That will deactivate (or "down") the network interface.

- Type `ip a` to view the configuration. You should see that there is no configuration currently.
- Type `ifup <network_interface>`

That should initiate the DORA process. Remember, it is:
- Discovery
- Offering
- Request
- Acknowledgement

You should actually see these steps listed on the screen. Analyze them. Try to understand what is happening in each step of the DORA process. 

### Analyze the Connection
View the current configuration with the `ip a` command. The Debian Server should now be obtaining an IP address from a DHCP server. You should see a different IP address in the results.

> Note: If you do not see an IP address, verify that you have a DHCP server running somewhere - either on your LAN or within your virtualization server. 

### Test the Connection
One of the most important things to remember is TO TEST!

Always test to make sure that a configuration or change you made is working properly. In this case, a basic ping will suffice. For example:

`ping example.com`

Verify that you get replies from the example.com domain. 

👍 **Well done!! Continue!**

---
