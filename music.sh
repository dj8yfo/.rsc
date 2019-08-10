#!/bin/sh
/usr/local/bin/tmux new-session -d -s cmus '/usr/bin/cmus --listen /home/sysmanj/.config/cmus/socket'
sleep 4
/usr/bin/cmus-remote -C "load ~/.music-current"
/usr/bin/cmus-remote -p
