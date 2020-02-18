### working through some issues
- the lang server (in the container) needs the same path as the host
- im using tcp to talk to the container's stdin/stdout and it timesout after some inactivity in vim
    - i think the watch parent process flag fixed this
