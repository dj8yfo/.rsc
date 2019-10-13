#!/bin/bash
cmus-remote --server $HOME/.config/cmus/socket -s
for i in $(seq 7);
do
    cvlc ~/Desktop/alarm_clock_1.wav vlc://quit
    vlc vlc://quit
done

cmus-remote --server $HOME/.config/cmus/socket -p
