# Lab 16 ⚙️

## Viewing the NetworkManager Log

Linux keeps a "journal" or a list of events that have happened on the system. You can query this journal with the journalctl command. 

- Type `journalctl` and use the arrow keys or the pageup and pagedown keys to see some of the logs. There is a lot of information, so we need to filter it. Press 'q' to escape and continue on.

- Filter by the unit or service. Issue the following command:

	`journalctl -u NetworkManager`

	This displays the journal entries related to the NetworkManager service. -u allows us to select the service (or unit) that we need to learn more about. But there can still be a lot of information so we can use the tail option to show the last 10 lines.

- Using tail: Issue the following command to see the last 10 lines of the journal as they pertain to the NetworkManager service.
	
	`journalctl -u NetworkManager | tail -10`

- Modify the command further so that the information is sorted into columns and is outputted to less. 

	`journalctl -u NetworkManager | tail -10 | column -t | less`

	The results might look similar to this:

	```
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2648]  device    (enp7s0):  state        change:      config       ->          ip-config    (reason  'none',   sys-iface-state:  'managed')       
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2744]  device    (enp7s0):  state        change:      ip-config    ->          ip-check     (reason  'none',   sys-iface-state:  'managed')       
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2801]  device    (enp7s0):  state        change:      ip-check     ->          secondaries  (reason  'none',   sys-iface-state:  'managed')       
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2811]  device    (enp7s0):  state        change:      secondaries  ->          activated    (reason  'none',   sys-iface-state:  'managed')       
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2940]  device    (enp7s0):  Activation:  successful,  device       activated.                                                                     
	Mar  30  18:37:41  fed-server  NetworkManager[672]:  <info>  [1617154661.2963]  manager:  startup    complete                                                                                                              
	Mar  30  18:37:43  fed-server  NetworkManager[672]:  <info>  [1617154663.6130]  dhcp6     (enp7s0):  activation:  beginning    transaction  (timeout    in           45       seconds)                                     
	Mar  30  18:37:43  fed-server  NetworkManager[672]:  <info>  [1617154663.6143]  policy:   set        'Wired       connection   1'           (enp7s0)    as           default  for       IPv6              routing     and  DNS
	Mar  30  18:38:28  fed-server  NetworkManager[672]:  <warn>  [1617154708.4711]  dhcp6     (enp7s0):  request      timed        out                                                                                         
	Mar  30  18:38:28  fed-server  NetworkManager[672]:  <info>  [1617154708.4716]  dhcp6     (enp7s0):  state        changed      unknown      ->          timeout        
	```
 
	You could also use the `-xe` and `-xeu` option combinations with `journalctl`.
	
	> Note: For more information on the journalctl command, type `journalctl --help`, and for more in-depth information, see the manual page: `man journalctl`

 👍 **Great work with the labs in this lesson!**
 
 ---

## 📚 Further Study
For more information on NetworkManager, see the following links:

- NetworkManager documentation: 
	https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/getting_started_with_networkmanager
	
- NetworkManager on Debian: 
	https://wiki.debian.org/NetworkManager


# Summary of the Three Main Networking Services
The three main networking services that we covered here are: networking, networkd, and NetworkManager. Each has its place and each has pros and cons compared to the others. 

You will normally find the networking service on a Debian server, the networkd service on an Ubuntu server, and the NetworkManager service on a Red Hat Enterprise Linux server (or Fedora/CentOS). 

The commands you use for each of the services will vary. The networking service will work well with commands such as `ip a`, `ifup`, `ifdown`, and modifying configuration files with VIM. networkd will work well with commands such as `ip a`, `networkctl`, and in the case of Ubuntu, `netplan`. The NetworkManager service is all about `nmcli` and the myriad of other tools available to you. 

Study the key points of these services and their respective Linux distributions and the configuration files and commands used within each.

---





