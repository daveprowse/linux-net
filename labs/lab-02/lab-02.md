# Lab 02 ⚙️

## Explore the networking Service

The networking service is mainly used by Debian servers. Therefore, you will need a Debian server (or some other system using the networking service) to accomplish the labs in this section. 

> Note: I recommend a Debian Server. For a step-by-step tutorial on how to install Debian Server, see [this link](https://prowse.tech/debian10-server/).

In Debian Server you will be placed in the terminal shell automatically. Be ready to type commands!

- Verify if the networking service is running:

	`systemctl status networking.service`

	> Note: This is the main status command, but you could run other ones, such as:
	- `service networking status`
	- `/etc/init.d/networking status`

- Analyze the results. Take a few minutes to read through the results of the command. 

- Stop the service:

	`systemctl stop networking`

	Now run the previous "status" command to view what happened. You should see that the service is now *inactive*. 

	> Note: Use the up arrow key to bring up previous commands.

- Start the service:

	`systemctl start networking`

	Run the "status" command again to verify that the service is *active*. 

- Disable the service: 

	`systemctl disable networking`

	Check the status of the service and analyze the results. It should show as *disabled*.

- Enable the service: 

	`systemctl enable networking`

	Check the status of the service and analyze the results. It should show as *enabled*.

- Disable and stop the service with one command:

	`systemctl --now disable networking`

- Enable and start the service with one command:

	`systemctl --now enable networking`


> Info:	For more information about the systemctl command, type `systemctl --help` and `man systemctl`

👍 **Great Work! You completed the Lab!**

---

## 📃 Extra Credit
> Note: All Extra Credit assignments are optional!

Check out the configuration file for the networking service itself:

`vim /etc/init.d/networking`

Analyze it. This is where you can configure the actual networking service. It get's into some more advanced networking in Debian Server. 