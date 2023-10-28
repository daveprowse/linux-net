## Countdown Script

Add the script below to your .bashrc file and then run it in the terminal.

```bash
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
```

Here are some ways you can run the command:

- with `countdown <seconds>` 
- or two hours: `countdown "$((2 * 60 * 60))"` 
- or a day: `countdown "$((24 * 60 * 60))"`

> Note: This script can conflict with other installed countdown timers.

---

I use a nice looking graphical countdown script. You can get it here:

https://github.com/antonmedv/countdown/releases

