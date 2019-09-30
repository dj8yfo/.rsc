#!/bin/sh
user=${USER:=hyphen9}
/usr/local/bin/tmux new-session -d -s cmus '/usr/bin/cmus --listen /home/$user/.config/cmus/socket'
sleep 4
/usr/bin/cmus-remote -C "load ~/.music-current"
/usr/bin/cmus-remote -p
