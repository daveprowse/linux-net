# Lab 35 ⚙️

## Advanced rsync

Let's take it to the next level, and show how to display the current progress with rsync while working with multiple files.

### Create a group of files in a directory

In this procedure we'll create two directories, and populate them with empty files. Then, we'll copy the both directories (and all the housed files) over to a remote location. Along the way we'll show how to display the progress of the file copy, and show how to use custom SSH ports. 

> Note:	Make sure you are working in a test directory with no data. 

For this lab I will be working within one directory (called Downloads) in a relative manner - meaning I won't be *changing* directories.

- First, create two test directories named "test1" and "test2"

  `mkdir {test1,test2}`

- Next, create 10 files within the test1 directory.

  `touch ./test1/file{1..10}`

- Now, verify that the files are inside of the test1 directory.

  `ls ./test1`

- Use rsync to copy the files to the test2 directory.

  `rsync ./test1/* ./test2`

At this point, we should have two sets of identical files in the test1 and test2 directories. we can easily check this by using the tree command from our current location. The results look like this:

```bash
user@deb52:~/Downloads$ tree
.
├── debian2.iso
├── debian.iso
├── test1
│   ├── file1
│   ├── file10
│   ├── file2
│   ├── file3
│   ├── file4
│   ├── file5
│   ├── file6
│   ├── file7
│   ├── file8
│   └── file9
└── test2
    ├── file1
    ├── file10
    ├── file2
    ├── file3
    ├── file4
    ├── file5
    ├── file6
    ├── file7
    ├── file8
    └── file9

2 directories, 22 files
```

So you can see that we are currently located in the Downloads directory. Inside that we have the test1 and test2 directories, each with 10 files. 

!!! note
  If you don't have access to the tree command, simply install it. For example, Debian doesn't include it by default, so `apt install tree`. 

### Copy a group of files in a directory to a remote system

Now we can finally copy the contents to the remote system! This next command is a little more advanced. 

`rsync -avP -e "ssh -p 22" {test1,test2} user@10.0.2.51:/home/user`

Here are the results at the local system where we run the command:

**Example**

  ```bash
  user@deb52:~/Downloads$ rsync -avP -e "ssh -p 22" {test1,test2} user@10.0.2.51:/home/user
  user@10.0.2.51's password: 
  sending incremental file list
  test1/
  test1/file1
          0 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=19/22)
  test1/file10
          0 100%    0.00kB/s    0:00:00 (xfr#2, to-chk=18/22)
  test1/file2
          0 100%    0.00kB/s    0:00:00 (xfr#3, to-chk=17/22)
  test1/file3
          0 100%    0.00kB/s    0:00:00 (xfr#4, to-chk=16/22)
  test1/file4
          0 100%    0.00kB/s    0:00:00 (xfr#5, to-chk=15/22)
  test1/file5
          0 100%    0.00kB/s    0:00:00 (xfr#6, to-chk=14/22)
  test1/file6
          0 100%    0.00kB/s    0:00:00 (xfr#7, to-chk=13/22)
  test1/file7
          0 100%    0.00kB/s    0:00:00 (xfr#8, to-chk=12/22)
  test1/file8
          0 100%    0.00kB/s    0:00:00 (xfr#9, to-chk=11/22)
  test1/file9
          0 100%    0.00kB/s    0:00:00 (xfr#10, to-chk=10/22)
  test2/
  test2/file1
          0 100%    0.00kB/s    0:00:00 (xfr#11, to-chk=9/22)
  test2/file10
          0 100%    0.00kB/s    0:00:00 (xfr#12, to-chk=8/22)
  test2/file2
          0 100%    0.00kB/s    0:00:00 (xfr#13, to-chk=7/22)
  test2/file3
          0 100%    0.00kB/s    0:00:00 (xfr#14, to-chk=6/22)
  test2/file4
          0 100%    0.00kB/s    0:00:00 (xfr#15, to-chk=5/22)
  test2/file5
          0 100%    0.00kB/s    0:00:00 (xfr#16, to-chk=4/22)
  test2/file6
          0 100%    0.00kB/s    0:00:00 (xfr#17, to-chk=3/22)
  test2/file7
          0 100%    0.00kB/s    0:00:00 (xfr#18, to-chk=2/22)
  test2/file8
          0 100%    0.00kB/s    0:00:00 (xfr#19, to-chk=1/22)
  test2/file9
          0 100%    0.00kB/s    0:00:00 (xfr#20, to-chk=0/22)

  sent 1,165 bytes  received 404 bytes  448.29 bytes/sec
  total size is 0  speedup is 0.00
  ```

Everything copied to the server. But what exactly happened here? Well, let's review the command we issued:

`rsync -avP -e "ssh -p 22" {test1,test2} user@10.0.2.51:/home/user`

The -a option is for archiving which we used before. But we also added -v for verbose, meaning we get a detailed response of what rsync is doing. -P is for progress. This gives us the status in real time (super-handy). Next, we see `ssh -p 22` which is telling us which shell to use (SSH), and the port to run it on (22). Because SSH is already running, and because we are using port 22 by default, we don't have to include this option. However, in some scenarios, SSH will be configured to use a different port (such as 2222) - in that case you would need to specify it: `ssh -p 2222`. We'll discuss this concept more in Day 2. Finally, we copied both directories `{test1,test2}` by simply comman separating them and encapsulating them in curly braces. You don't need the entire path or even relative paths when using rsync.  

> Note:	You could also install the progress program (`apt install progress`) and run the `watch progress` command to view the progress of processes including large data transfers with rsync or SCP, DD processes, and anything else that runs behind the scenes. 

Subsequent transfers using the same command will work in an incremental fashion. That means that only new files or files that have been changed will be copied over. rsync processes each file during the initial and subsequent file copy processes. This makes for quick periodic (or incremental) backups.

> Note:	Automate with rsync! Use it within a cron job or other automated system to periodically copy files from one location to another. But be sure to test it periodically too! Make sure your file copies are running properly!


👍 **Excellent ^**
  
---

