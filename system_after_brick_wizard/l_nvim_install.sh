#!/bin/bash
set -e
set -x
source ./__prompt.sh
prompt_install "nvim installation"

pyenv virtualenv 2.7.14 neovim2 || true
pyenv virtualenv 3.8.5 neovim3 || true

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get -y install neovim

sudo apt-get install -y libboost-all-dev cmake libicu-dev
sudo -u hypen9 curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sudo -u hypen9 sh ./installer.sh ~/.local/share/dein
sudo -u hypen9 rm -rf ~/.config/nvim
sudo -u hypen9 git clone git@github.com:dj8yfo/.vimrc.git ~/.config/nvim

echo "nvim done"
