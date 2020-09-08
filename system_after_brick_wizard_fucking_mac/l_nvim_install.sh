#!/bin/bash
set -e
set -x
source ./__prompt.sh
prompt_install "nvim installation"

pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.8.5 neovim3

brew install neovim ctags

# sudo apt-get install -y libboost-all-dev cmake libicu-dev
sudo -u rblstrmtp curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sudo -u rblstrmtp sh ./installer.sh ~/.local/share/dein
sudo -u rblstrmtp rm -rf ~/.config/nvim
sudo -u rblstrmtp git clone git@github.com:dj8yfo/.vimrc.git ~/.config/nvim

echo "nvim done"
