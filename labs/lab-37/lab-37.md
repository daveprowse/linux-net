# Lab 37 ⚙️

## wget

**What is wget?**
From the man page:

"GNU Wget is a free utility for non-interactive download of files from
the Web.  It supports HTTP, HTTPS, and FTP protocols, as well as
retrieval through HTTP proxies.

Wget is non-interactive, meaning that it can work in the background,
while the user is not logged on.  This allows you to start a retrieval
and disconnect from the system, letting Wget finish the work.  By
contrast, most of the Web browsers require constant user's presence,
which can be a great hindrance when transferring a lot of data."

---

So... wget follows HTML and can recreate local versions of websites.

If you don’t have it, you can install it - example:

`apt install wget` or `dnf install wget`

wget also allows a user to download files from a web server (and FTP servers) through the command line.

Bottom line - You can grab any URL you want.

### Get an index file and view it
Example:

`wget https://www.prowse.tech/`
	
Now, view the index.html file that was downloaded. 

`vim index.html`

You can see the HTML code in the file.

Next, view the file in a browser. For example:
  
`chrome index.html`

That should show a "similar" prowse.tech home page. Not complete, but you get the idea. With the right combination of options, you can re-create many a website. 

### Example of wget with recursive searching
Incorporate the `-r` option. Example:

`wget  -r  https://www.prowse.tech/`
	
Now take a look at the contents within the "prowse.tech" directory. 
  
Note that wget looks laterally (and indeed ascends to parents if any). This is essentially the whole website!

### Examine the help file

`wget --help`

Here are a few options you might use:

- `-r` is recursive and will search through directories. 
- `-l=NUMBER` can specify how many levels of directories to search through.	
- `-nd` means "no directories" (doesn't create dirs for each file)
- `-np` means "no parent" so it won't ascend (as it does by default)
- `--accept=<extension>` only specific extensions

### Put it all together
Wget is primarily meant to be used to retrieve files from websites and other servers. Let's do just that.

- Go to the HashiCorp website where Terraform binary files can be downloaded.

https://releases.hashicorp.com/terraform

- Select the link for the latest version.

- Copy the URL to the clipboard. 

- Grab all the files at the directory

`wget -nd -np -r --accept=.zip https://releases.hashicorp.com/terraform/<version_number>`

This should get all of the .zip Terraform binary files and place them in the current directory.

> Challenge: Do you know what each of the options in the command do? 

### Log the process
You can also log the process of file retrieval instead of the log being written to the terminal. For example:

`wget -a log.txt https://prowse.tech`

Take a look at the log file, it should show the same type of results as when we ran the command previously.

Work with the wget command and the help file to become more familiar with it. Have fun!

👍 **"Get" thee to the next lab!**
