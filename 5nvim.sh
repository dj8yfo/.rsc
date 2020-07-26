#!/bin/bash
pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.8.0b4 neovim3

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get install neovim

apt-get install libboost-all-dev cmake libicu-dev
sudo -u hypen9 curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sudo -u hypen9 sh ./installer.sh ~/.local/share/dein
sudo -u hypen9 rm -rf ~/.config/nvim
sudo -u hypen9 git clone git@github.com:dj8yfo/.vimrc.git ~/.config/nvim

pyenv activate neovim2
pip install neovim
pip install pynvim
pip install jupyter
pyenv deactivate

pyenv activate neovim3
pip install neovim
pip install pynvim
pip install jupyter
pip install urllib3
pyenv deactivate
