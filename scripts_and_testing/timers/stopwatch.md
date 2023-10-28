## Stopwatch Script

Add the function below to your .bashrc file and then run it in the terminal by issuing the `stopwatch` command.

```bash
stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
```

---

You could also use the `time` command as a stopwatch. For example, you could type: 

`time cat`

And stop it when you are finished with a task. That will give results similar to this:

```
user@debclient:~$ time cat
^Z
[8]+  Stopped                 cat

real	0m3.468s
user	0m0.000s
sys	    0m0.001s

```