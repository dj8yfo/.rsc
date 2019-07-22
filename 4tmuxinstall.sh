#!/bin/sh
set -e
apt-get install libevent-dev
apt-get install libncurses5-dev libncursesw5-dev
wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz
tar -xzf tmux-2.9a.tar.gz
cd tmux-2.9a
apt-get install automake
./configure && make
sudo make install
cd ..
sudo -u sysmanj cp .tmux.conf /home/sysmanj/
sudo apt-get install xclip
git clone https://github.com/powerline/fonts.git ~/Downloads/powerfonts
cd ~/Downloads/powerfonts/Terminus/PCF
sudo cp ter*pcf.gz /usr/share/fonts/X11/misc
sudo mkfontdir /usr/share/fonts/X11/misc
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
sudo apt-get install fasd
git clone git@github.com:peterhurford/git-aliases.zsh.git ~/.oh-my-zsh/custom/plugins/git-aliases

chmod +x music.sh
chmod +x safeeys.sh
cp music.sh $HOME/
cp safeeys.sh $HOME/
cp .tmux-pane.conf $HOME/
