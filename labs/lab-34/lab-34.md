# Lab 34 ⚙️

## Working with rsync

rsync is a fast, versatile, remote (and local) file-copying tool (to quote the MAN page!). While it can be used for local copying of files, it is more commonly used for remote copying. One of the great features of rsync is that it can act as an archive for your data and, after an initial file copy, will *incrementally* copy files as they are modified or added to a directory. This, among other things, makes it a formidable tool. 

*rsync should usually work over SSH by default.* If you have rsync installed on both systems, and SSH installed on both systems (and you probably do), and the SSH server is running on the remote system, and you know the password or have the key, then rsync will work over SSH automatically. That is generally the use case for administrators. 

> Note: If your system does not have rsync installed, a quick `apt install rsync` will remedy the situation. 

### Copy a file from a local system to a remote system. 

Example:

`rsync -a debian.iso user@10.0.2.51:/home/user`		

As you can see, this is very similar to SCP. There is a source and a destination, and in this case we are "pushing" the file to a remote system (our Debian server). The only difference is the options that rsync uses (and there are a lot of them). I have added the archive option (-a) after rsync. This is a very commonly used option (in fact, I use it consistently). 

Here are the results:

```bash
user@deb52:~/Downloads$ rsync -a debian.iso user@10.0.2.51:/home/user
user@10.0.2.51's password: 
user@deb52:~/Downloads$ 
```

It worked, but we don't see any results. By default, rsync goes by the "no news is good news" rule. So it won't tell us what is happening unless we request that information. Of course, if there was an error (no such directory, no permissions, etc...) then the program would tell us that there was a failure. 

👍 **Nice! Keep Going!**
  
---

