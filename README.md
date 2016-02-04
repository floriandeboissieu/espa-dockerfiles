# NOT WORKING - DEVELOPMENT - PROTOTYPE - WORK IN PROGRESS

### General Docker Notes

#### Mounting A Volume
- I prefer mounting a volume from the command line since it is more configurable, and you don't have to rebuild an image when you want to change the mount.
  - See example in System Time below.
  - You can mount files as well as directories using the --volume command.
  - Requires the host to have that directory or file present.
- You should consider applying the mode attribute to the volume being mounted.
  - By default volumes are mounted read-write (:rw)
  - If you want to mount read-only specify (:ro)
  - See example in System Time below.
- When specifying a volume, <b>if it does not exist on the host</b>, it will be created (assuming you have privileges).
  - Learned that the hard way......

#### System Time
By default the time on the system is UTC.  If you wish to change that to the time specified on the host system, you simply have to mount /etc/localtime from the host.
- --volume /etc/localtime:/etc/localtime:ro
