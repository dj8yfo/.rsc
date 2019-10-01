#!/bin/sh
#set -e

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install git
sudo apt-get install curl wget
sudo apt-get install xfonts-terminus console-terminus
sudo apt install -y rxvt-unicode xclip xsel
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/-1.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
sudo apt-get install zsh
sudo apt install offlineimap
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.xinitrc $HOME/.xinitrc
ln -s $PWD/.xmodmap $HOME/.xmodmap
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.zprofile $HOME/.zprofile
cp better-completion.zsh $HOME/.oh-my-zsh/custom/
sudo ln -s $PWD/fe /usr/local/bin/fe
sudo ln -s $PWD/fw /usr/local/bin/fw
chsh -s `which zsh`
