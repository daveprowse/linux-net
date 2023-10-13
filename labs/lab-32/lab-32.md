# Lab 32 ⚙️

## Using SSH Keys

SSH is a heavily used tool. However, it is vulnerable (like everything else). This section describes how to secure an SSH connection with cryptographic keys.

Remember that a typical SSH connection is performed from one computer to another. For example, if *computerA* wanted to SSH into *computerB* then the user at computerA would type:

`ssh user@computerB`

If the user at computerA knows the password of the user account at computerb, then access will be granted. However, while passwords offer some security, it's more secure to use cryptographic keys. 

> Note: This is a longer lab (and lab document). Pay careful attention and take breaks if necessary.

### SSH Key Basics

In this lab we'll build an SSH key on a Debian client (as a typical user), distribute it to a Debian server, and then SSH into that server from the client using the key we just made.

To SSH into a system using a key, you actually need to create a key *pair*. The first key is called a private key and it resides at the computer where the key pair is built. The second key is called a public key, and it resides at the SSH server, meaning the remote computer that will be connected to. 

When you attempt to SSH into the remote system, that system presents its public key. If it matches the private key stored at the local computer, then the connection is allowed. If it doesn't match (for example, a rogue or malicious system) then the connection will be denied. 

### Create an RSA-based key pair

To create an SSH key pair, login to the client as a typical user, and type the following:

`ssh-keygen`

When it prompts you, press enter to save the key pair to the default location. It's also highly recommended to select and confirm a complex passphrase to protect the keypair.  The process will be very similar to the following:

```
user@deb52:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/user/.ssh/id_rsa.
Your public key has been saved in /home/user/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:amG7G71T2CxDiruTOhO+1niqtV7X6Zer9B3BGjpWKTQ user@deb52
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|                 |
|        E        |
|       ... o     |
|     .ooS++ o    |
|  . ...*+=+o .   |
| ..+.o* O+...    |
| .*o*o *.+o. .   |
|.+*B.oo.++o..    |
+----[SHA256]-----+
user@deb52:~$ 
```

**DANGER** 

Pressing enter for a blank passphrase is insecure. For added security, use a passphrase. The more length and complexity the better. This protects the key pair that you have created. Think about it: If someone was to gain access to your computer (internally or externally), and more importantly to your user account, then that person could potentially gain access to all the systems that you would normally access via SSH. 

> Note:	When you do use a passphrase fo the SSH key pair, you will be required to type it the first time you connect to a remote host using the SSH key. Subsequent attempts during a single login session will not require it unless you are doing double SSH: meaning if you are SSH'd into the client, and then are SSH'ing from there into another system. However, all of this is configurable at the system where the keys were created in the /etc/ssh/ssh_config file. Just be careful of how loose you are with security!

### View the SSH key pair

The key pair is saved in a hidden directory. Type `ls -a` to see it. The directory name is .ssh. Access that directory: `cd .ssh`. Then type `ls` to view the contents. The procedure should be similar to the following:

```
user@deb52:~$ ls -a
.              .bash_logout           .cache   Documents         .gnupg         .local    Music           Pictures  .qt             .ssh       .viminfo
..             .bash-powerline-ng.sh  .config  Downloads         .ICEauthority  .mono     .nmcli-history  .profile  .recently-used  Templates  .wget-hsts
.bash_history  .bashrc                Desktop  .fancy-prompt.sh  .lesshst       .mozilla  .nx             Public    script.sh       Videos     .Xauthority
user@deb52:~$ cd .ssh
user@deb52:~/.ssh$ ls
id_rsa  id_rsa.pub  known_hosts
user@deb52:~/.ssh$ 
```

You can see three files inside of .ssh: id_rsa (which is the private key), id_rsa.pub (which is the public key to be copied to remote hosts), and known_hosts, which contains the list of known hosts that you have connected to in the past. 

> Tip: You can make bigger keys if your organization requires it. Let's say you needed 4096-bit. You could type the following:

	`ssh-keygen -b 4096`

Remember to use different names/directories when creating subsequent keys. 

### Copy the public key to a remote host

Now that our key pair is created, we can copy the public key of our key pair to a remote host. In this lab the key will be copied to a Debian server, making use of the user account that exists there. 

`ssh-copy-id user@10.0.2.51`

You will be required to type the password of the user account at the remote computer, but otherwise, that's it. You don't have to specify a directory, it will copy it to the default .ssh directory in the user accounts home directory. Just make sure that the results show that 1 key was added. Example:

```
user@deb52:~/.ssh$ ssh-copy-id user@10.0.2.51
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/user/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
user@10.0.2.51's password: 

Number of key(s) added: 1
```

Now try logging into the machine, with:   "ssh 'user@10.0.2.51'"
and check to make sure that only the key(s) you wanted were added.

### SSH into the remote host

Now, we can SSH into the remote host to take control of it. 

`ssh user@10.0.2.51`

The command is the same as normal. For the first time, the local system will require that we enter the SSH key passphrase (if we set one). Example:

```
user@deb52:~$ ssh user@10.0.2.51
Enter passphrase for key '/home/user/.ssh/id_rsa': 
Linux deb51 4.19.0-16-amd64 #1 SMP Debian 4.19.181-1 (2021-03-19) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon Apr 12 17:49:33 2021 from 10.0.2.52
user@deb51:~$ 
```

As you can see, we are using a system *deb52* and SSH'd into a remote server *deb51*. 

That's it. Now we are logged in using SSH keys. This way, we don't have to send a user's password over the network, and instead rely on the much more secure SSH key process. 

👍 **This is serious business. If you have come this far, congratulations! Excellent Work!**
  
---

## 📚 Further Study
Learn more about OpenSSH: http://www.openssh.com/