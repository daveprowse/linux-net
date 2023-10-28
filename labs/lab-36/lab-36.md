# Lab 36 ⚙️

## Working with SFTP Locally

Secure File Transfer Protocol (SFTP) is widely used for remote file uploads and retrieval. Like SCP, SFTP piggybacks on SSH. But where SCP is used for single file transfers, SFTP can be used to move multiple files and directories - multiple times within an SFTP session. 

SFTP can resume file transfers and has more functionality than SCP, plus when you log in, you are placed in the SFTP shell, where you have many commands at your disposal. You can manipulate the remote system's directories and files as well as the local system's files and directories when you are logged into an SFTP shell. 

> Note: There are plenty of other SFTP packages available. For this lab we will simply use SFTP, which works as part of OpenSSH. 

In this lab, we'll connect to an SFTP server, view the contents, retrieve a file, and place a file on the server as well. In the example I'll be showing a Fedora system (10.0.2.55) connecting to a Debian system (10.0.2.52), but any Linux distribution will work in the same manner as long as you have OpenSSH installed. 

### Connect to the OpenSSH server

`sftp user@10.0.2.52` 

Login with your password.

Change to the Downloads directory: `cd Downloads`. Then type `ls` to see its contents. (If you are not using the Downloads directory, access whatever directory you are storing files in.)

You should see similar results to this:

```bash
[user@fed-client ~]$ sftp user@10.0.2.52
user@10.0.2.52's password: 
Connected to 10.0.2.52.
sftp> cd Downloads/
sftp> ls
debian.iso   debian2.iso  test1        test2        
sftp> 
```

Here we can see the debian .iso files and the test1 and test2 directories that we worked with previously. 

### Retrieve a file from the SFTP server

Retrieving a file is easy. Type `get <filename>`. That's it. So for example:

`get debian.iso`

That will grab the debian.iso file from the remote system, and place it in the last directory we were working in. In this scenario I happened to be working in the Desktop directory. To show that the file indeed downloaded to our local system, we can run the `lls` command, which is *local* list directory contents. This is all shown in the example below:

```bash
sftp> get debian.iso
Fetching /home/user/Downloads/debian.iso to debian.iso
/home/user/Downloads/debian.iso                                                                       100%  336MB 210.8MB/s   00:01    
sftp> lls
debian.iso
sftp> 
```

> Note:	Many commands can be run locally while in an SFTP session. Just place an 'l' before the command. For example, `cd` becomes `lcd`, `mkdir` becomes `lmkdir`, and `pwd` becomes `lpwd`. 

### Place a file on the remote system

Pushing files to the remote system is easy also. Just use the put command. For example:

`put debian.iso`

That will put the file into the current remote working directory. That file is actually already there, so we can change the remote directory if need be. In the example below, I create a new directory, change to it, and then put the file in that new directory.

```bash
sftp> lls
debian.iso
sftp> mkdir isos
sftp> cd isos
sftp> put debian.iso
Uploading debian.iso to /home/user/Downloads/isos/debian.iso
debian.iso                                                                                            100%  336MB 252.8MB/s   00:01    
sftp> 
```

While in an SFTP session, press the ? key to access a basic help system and list of commands that you can run. 

That's about it. When finished you can exit the session by typing `bye` or `quit` or by pressing Ctrl + d. 

👍 **Perfect!**
  
---

## Summary
	
That wraps up the section on SSH, SCP, rsync, and SFTP. They are powerful tools, and each one has its own purpose. Practice with them to master their usage. 

We worked with the Secure Shell (SSH) to remotely control systems from the command line. We also worked with Secure Copy (SCP) to easily copy files from one system to another over an SSH connection. Then we used an alternative to SCP called rsync which not only copies files, but can archive them, and work in an incremental fashion. Finally, we used Secure FTP (SFTP) to move files back and forth between a local system and a remote system. SFTP, unlike SCP and rsync, works within an interactive shell which allows us to perform many actions instead of just one. 

With SCP, rsync, and SFTP, transactions are either *push* (from the local system to the remote system) or *pull* (from the remote system to the local system). The command structure is always `command source destination` regardless of whether you are performing a push or a pull. 

Remember to practice these commands as much as possible to become familiar with them. This skill is necessary for most IT technicians. 

> Reminder: To learn more about any one of these commands, simply type `<command> -h` or `man <command>` - where `<command>` is either ssh, scp, rsync, or sftp. 


