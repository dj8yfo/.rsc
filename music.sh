#!/bin/sh
/usr/local/bin/tmux new-session -d -s cmus '/usr/bin/cmus'
sleep 4
/usr/bin/cmus-remote -C "load ~/.music-current"
/usr/bin/cmus-remote -p
