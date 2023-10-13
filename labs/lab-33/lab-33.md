# Lab 33 ⚙️

## Working with SCP

SCP (or Secure Copy) allows a person to copy one file or entire directories to separate systems. It works as an extension of SSH. But it doesn’t log into systems, and there is no shell involved (unlike SFTP for example). It is primarily a one-time use command. 

In this lab we'll use SCP to copy files from a local host to a remote host, and vice-versa. The general syntax for this would be:

`scp <source> <destination>`

### Copy a file from the local host to the remote host

This is known as a "push" of data. 

The source will be a file (debian.iso) on our local system, which is a Debian client (10.0.2.52). The destination will be the remote computer, which is a Debian server (10.0.2.51). 

> Note:	Any large file will do. In this lab I'm using a Debian ISO image that I renamed to debian.iso. You can get the various Debian images at the following link: https://www.debian.org/distrib/netinst. You could also grab a particular image using the wget command. For example:

`wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso`

Download an image and rename it to "debian.iso".

`mv <image_name> debian.iso`

Here's an example using SCP to copy from the local system to a remote system:

`scp debian.iso user@10.0.2.51:/home/user`

So the source is "debian.iso"

And the desintation is "user@10.0.2.51:/home/user"

Here is what we see on the screen when we issue the command from the Debian client. 

```bash
user@deb52:~/Downloads$ scp debian.iso user@10.0.2.51:/home/user
user@10.0.2.51's password: 
debian.iso                          100%  336MB 188.4MB/s   00:01	
```

Let's break down what is happenening here. 
- First, we issue the `scp` command. 
- Second, we specify the file to be copied. The file is debian.iso, and its located in the Downloads directory. 
- Next, we state the user account and IP address that we want to connect to. Remember that SCP works off of SSH, so the login process works in the same manner. In this case, we are connecting as "user" on the IP address 10.0.2.51. (Note that you should make sure that the "user" account exists on the remote system.) 
- After that, we state the path on the destination computer where we want to copy the file. Always use a colon (:) after the IP address and before the path, then give a valid Linux path. In this case, we copied the file to the /home/user directory. When we press enter, it asks for credentials (based on SSH) - in this case the password of the user account on the remote system. 
- Once we type the correct password, the file transfer is initiated. It copied the debian.iso file quickly to the destination. 
- That's it!

> Note: Remember to know exactly what the source and the destination are. Also, make sure that you know the user account and password of the remote machine. Finally, make sure that the user account in question has the appropriate permissions to copy files. 

### Copy a file from the remote host to the local host

This time we'll copy a file, but in reverse. We'll do this at the Debian client once again, but now we'll grab the data from the server. This is known as a "pull" - when the data comes from the remote system and arrives at the local system that we are working at. 

`scp user@10.0.2.51:/home/user/debian.iso /home/user/Downloads/debian2.iso`

Here it is in action:

```
user@deb52:~/Downloads$ scp user@10.0.2.51:/home/user/debian.iso /home/user/Downloads/debian2.iso
user@10.0.2.51's password: 
debian.iso                              100%  336MB 172.6MB/s   00:01    
user@deb52:~/Downloads$ ls
debian2.iso  debian.iso
```

This time, the file is stored at the Debian server (which is 10.0.2.51). I simply took the same debian.iso file and copied it back. But I renamed it during the copy to "debian2.iso" so that it wouldn't overwrite the file we already had. Afterward, you can see the `ls` command displays both .iso files within the Downloads directory. Of course, you could copy it without a file name to whatever location you want, or change the name as you see fit. At that point, the basic rules of Linux copying take effect. 

> Note:	You can also copy entire directories. Just use the `-r` option after scp. It works in the same manner as the `cp` command locally. You can in fact use SCP locally as well, but for the most part sysadmins use it for remote copying of files as that is what it is mainly designed for. 


👍 **You are doing great! Keep going!**
  
---

## 📚 Further Study
Learn more about SCP:
- `scp -h`
- `man scp`