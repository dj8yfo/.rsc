#!/bin/bash
task +alarm
if cmus-remote --server $HOME/.config/cmus/socket -C status | grep -w playing;
then
    stat=playing
else
    stat=stopped
fi
[ $stat = "playing" ] && cmus-remote --server $HOME/.config/cmus/socket -u
for i in $(seq 1);
do
    cvlc $HOME/alarm_clock_1.mp3 vlc://quit
    vlc vlc://quit
done
[ $stat = "playing" ] && cmus-remote --server $HOME/.config/cmus/socket -u
