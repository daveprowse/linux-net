# Lab 23 ⚙️

## dig and nslookup

### Using the dig command to analyze websites

- Run the command `dig example.com`

View the results. You should be able to see the DNS entry for example.com which corresponds to the IP address 93.184.216.34.

Try the dig command on a few other websites of your choice. 

### Using the dig command to run a reverse lookup
- First, ping a website of your choice. Locate the IP address in the results.

- Next, run the command `dig -x <ip_address>` using the IP address you found previously. View the details, especially in the Answer Section. 

### Using nslookup
Try this command:

`nslookup example.com`

Examine the results. Compare with the `dig` results.

> Note: The `nslookup` command can be run by itself to enter an interactive shell. Type `exit` when you are done.

> Note: While `nslookup` is okay, `dig` is preferred.

👍 **CAN YOU DIG IT?!?!**
  
---

## 📚 Further Study
Be sure to check the help file and manual page for `dig`
- `dig -h`
- `man dig`