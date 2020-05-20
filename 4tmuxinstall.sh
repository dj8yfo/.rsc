#!/bin/sh
set -e
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz
tar -xzf tmux-2.9a.tar.gz
cd tmux-2.9a
sudo apt-get install automake
./configure && make
sudo make install
cd ..
git clone https://github.com/powerline/fonts.git $HOME/Downloads/powerfonts
pushd $HOME/Downloads/powerfonts/Terminus/PCF
sudo cp ter*pcf.gz /usr/share/fonts/X11/misc
sudo mkfontdir /usr/share/fonts/X11/misc
sudo ftpane /usr/local/bin
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf

popd
cp ./.tmux-pane.conf $HOME/
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack
