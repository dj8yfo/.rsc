#!/bin/sh
set -e

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim
apt-get install task
apt-get install git
apt-get install xfonts-terminus console-terminus
apt-get install ttf-liberation
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb
apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

cp .bashrc .xinitrc .xmodmap .zprofile .zshrc ~/
chsh -s `which zsh`
