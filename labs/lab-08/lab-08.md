# Lab 08 ⚙️

## Analyzing systemd-networkd in Ubuntu Server
The systemd-networkd service (or simply networkd) is used by Ubuntu server and in some other special situations. For best results, use an Ubuntu server to accomplish the following labs.

### Start and stop the networkd service

- Check the service first:

    `systemctl status systemd-networkd`

    Verify that the service is running. Then analyze the results for a couple of minutes.

- Stop the service

    `systemctl stop systemd-networkd`

- Start the service

    `systemctl start systemd-networkd`

    Verify that the service is running properly.

👍 **Very Good! Go for more!**

---
