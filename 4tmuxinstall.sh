#!/bin/sh
set -e
apt-get install libevent-dev
apt-get install libncurses5-dev libncursesw5-dev
git clone https://github.com/tmux/tmux.git
cd tmux
apt-get install automake
sh autogen.sh
./configure && make
make install
cd ..
sudo -u sysmanj cp .tmux.conf /home/sysmanj/
apt-get install xclip
