#!/bin/bash
apt-get install libboost-all-dev cmake libicu-dev
sudo -u sysmanj curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sudo -u sysmanj sh ./installer.sh ~/.local/share/dein
sudo -u sysmanj rm -rf ~/.config/nvim
sudo -u sysmanj git clone git@github.com:gisochre/.vimrc.git ~/.config/nvim
