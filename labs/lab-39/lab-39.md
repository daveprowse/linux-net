# Lab 39 ⚙️

## NetPerf and Qperf

Network performance tools can be used to measure the data throughput between one system and another. This lab shows how to use the NetPerf and Qperf tools to do just this. 


## Working with NetPerf

NetPerf is a network performance measuring tool. It can test the data throughput between systems (also known as data transfer rate). However it is not a “free” program in the Linux sense. We can use it for free, but to install it we need the “non-free” attribute added to our download repositories.

Let’s install it and show how it works. 

> Note: You will need two Linux systems to complete this lab.

### Configuring the Server
Choose a Linux system to be your "server". Configure it as follows:

- Modify the repositories

  Open the sources/list file. For example, in Debian:
  
  `sudo vim /etc/apt/sources.list`

  or

  `sudo apt edit-sources`

  > Note: If you are working on a pure Debian Server, `sudo` won't be necessary.

- add “non-free” to first two repos. For example:

  ```bash
  deb http://deb.debian.org/debian/ bookworm main non-free-firmware non-free
  deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware non-free
  ```

- Run `sudo apt update` to update the repository listing.
  
  > Note: Fedora-based systems do not need to have the repositories modified. 

- Install NetPerf:

  `sudo apt install NetPerf`

- Verify it is installed

  `netperf -h`
  
### Run NetPerf at the Server
We want to analyze the transmission of data from a client to a server. So we'll run the *netserver* command at the server. This is part of the NetPerf program.

`netserver -p 50000`

### Configure the Client
- Modify sources (like we did on the other system)
- Update the system (`sudo apt update`)
- Install NetPerf

  `sudo apt install netperf`

### Analyze from the client and test
- Try the following command:

`netperf -H 10.0.2.51 -p 50000`

You should see results. The data throughput should be clearly displayed. However, it might require a little more clarity to read properly! 😁

The number you are seeing is being displayed as Mbps. We should solve for Gbps. 

10^6bits/sec means the base unit of measurement is 1,000,000 bits per second. So you would multiple that by whatever the actual measured number is. For example:

1.763 x 10^6 is 1.76 Gbps

Another example: 29516.46 would be 29.516 Gbps.

Try the command from different systems on the LAN or within your virtualization network. Compare the results!

- Let's try another command

`netperf -H 10.0.2.51 -p 50000 -D 2 -f G`

`-D 2` changes the interim of reporting to every 2 seconds
`-f G` changes the outputed measurement to GBytes/sec  (multiple by 8 to get bits)

## 📃 Extra Credit

## Working with qperf
Let's see if you can get qperf to work on your own. I'll give a couple of hints.

- Install it to two systems  (it's called "qperf")
- Imagine what command you might issue to run it on a server. It's real simple.
- Connect from the client to run your test. Consider using the following sources for help:
  - `qperf --help`
  - `qperf --help examples`

Analyze your results!

---

### 😲 **Your performance is exemplary!**
