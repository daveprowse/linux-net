# Lab 38 ⚙️

## curl

**What is curl?**
From the man page:

"**curl**  is a tool to transfer data from or to a server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS,  LDAP,  LDAPS,  MQTT, POP3, POP3S, RTMP, RTMPS, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP). The command  is  designed to work without user interaction."

---

So... it can transfer files using just about any protocol under the sun! Also, it is meant for scripts. 

If you don’t have it, you can install it - example:

`apt install curl` or `dnf install curl`

Let’s show how to use it to grab a web page, download a file, and run a script.

### Basic curl of a web page
Execute the following command:

`curl https://prowse.tech >> index.html`

That should grab the main index.html page from my website and write it to a file named index.html locally. 

>For fun, try the following:
>
>`curl 127.0.0.1`
>
>`curl ifconfig.me/all`

### Download a current version of Terraform
- Make a new directory and access it:
  
  `mkdir test-dir && cd test-dir`

- Open the Terraform binary directory in your browser:

  https://releases.hashicorp.com/terraform

- Click on the latest stable version.
- Copy the link for the Linux AMD_64 version platform version of Terraform. 
- Download the binary with curl:

  `curl -Lo ./terraform.zip <http_URL_of_terraform_binary>`

  That should download the binary to the current working directory and rename it to "terraform.zip".

- Unzip it:

  `unzip terraform.zip`

- Verify that it is working:

  `./terraform -v`

### View the curl help files

Take a look at the `curl` help and man pages

`curl --help`

`man curl`

See if you can figure out what the `-L` and `-o` options do.

> Note: The man page for `curl` is massive. Use your searching capabilities!
   
### Install Kea with the help of curl
Kea is a DHCP server program designed by the ISC. It's heavily used in the field. It requires a script to run.

Let's show how to use curl to initiate that script:

```bash
curl -1sLf \
'https://dl.cloudsmith.io/public/isc/kea-2-4/cfg/setup/bash.deb.sh' \
| sudo bash
```

That should download a script called "bash.deb.sh" and run it. The script is designed to do two things: 1. Make sure the proper dependencies are installed on your Linux system, and 2. Setup the repository for ISC Kea. 

> Note: This lab document was originally written in October of 2023. If a significant amount of time has passed, you might need to use a newer version of Kea.

Now that your system is prepared, install the DHCP4 Kea server:

`sudo apt install isc-kea-dhcp4-server`

Now check it:

`systemctl status isc-kea-dhcp4-server`

It should show as active. This is a very powerful DHCP server program that can be used to take care of IP addressing for thousands, even millions, of hosts. Check out the built-in, sample configuration file:

`/etc/kea/kea-dhcp4.conf`

> Note: If you wish to remove Kea, you can do so with `apt remove isc-kea-dhcp4-server` or simply stop and disable the service if you want to keep it but don't want it to interfere for the time being.

### Shameless Plug: 
If you are interested in Kea, check out my video course - *Building Linux Servers - DHCP, DNS, and Directory Services*:

Available at [O'Reilly](https://www.oreilly.com/videos/building-linux-servers/9780137368495/) (*subscription required*).

---

### 🥌🏋🏼 **You just did some heavy lifting. :) Take a break, then continue!**
