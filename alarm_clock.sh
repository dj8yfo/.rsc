!/bin/bash
cmus-remote --server $HOME/.config/cmus/socket -s
cvlc ~/Desktop/alarm_clock_1.wav vlc://quit
vlc vlc://quit
cmus-remote --server $HOME/.config/cmus/socket -p
