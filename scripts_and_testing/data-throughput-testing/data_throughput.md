# Data Throughput Testing

In this video course we work with NetPerf and qperf but there are many other tools and scripts that you can use to analyze the data throughput of your network. 

## iperf
- Install it: `sudo apt install iperf`
- Run it as a server on the target machine

  `iperf -s`

- Connect from a client to test throughput:
  
  `iperf -c <ip_address_of_target>`

- Wait 10 seconds for the results. You should see the data throughput measured in bps (bits per second), for example: 1.6 Gbits/sec.

## Netcat
Make sure it is installed. 

At the "server"
`nc -vvlnp 12345 >/dev/null`

At the client: Send a gigabyte of zeros using dd over the nc tunnel.

`dd if=/dev/zero bs=1M count=1K | nc -vvn 10.10.0.2 12345`

## Command/Script using DD
This command requires that you can connect via SSH to the target computer. Run the command at a client that you wish to test from:

`ssh user@<IP_address> 'dd if=/dev/zero bs=1GB count=3 2>/dev/null' | dd of=/dev/null status=progress`

---

There are plenty of other methods. You could even build your own Bash script to test the data throughput on your network. Experiment!


