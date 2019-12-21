#!/bin/bash
#set -e

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install git
sudo apt-get install curl wget tree
sudo apt-get install xfonts-terminus console-terminus
sudo apt install -y rxvt-unicode xclip xsel
#rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
softhome=$HOME/Documents/soft
mkdir -p $softhome
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
. alacritty_install.sh
sudo cp ./var-scripts/days-between /usr/local/bin
sudo chmod +x /usr/local/bin/days-between

sudo cp ./var-scripts/alarmsequence /usr/local/bin
sudo chmod +x /usr/local/bin/alarmsequence

sudo cp ./var-scripts/set-bri /usr/local/bin
sudo chmod +x /usr/local/bin/set-bri
# sudo add-apt-repository -y ppa:mmstick76/alacritty
# sudo apt-get install -y alacritty
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
sudo apt-get install -y zsh
sudo apt-get install -y awesome
mkdir -p $HOME/.config/awesome
ln -s $PWD/awesome/rc.lua $HOME/.config/awesome/rc.lua
git clone https://github.com/guotsuan/awesome-revelation ~/.config/awesome/revelation
ln -s $PWD/awesome/awesome.desktop $HOME/.config/autostart/awesome.desktop
ln -s $PWD/awesome/compton.desktop $HOME/.config/autostart/compton.desktop

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.xinitrc $HOME/.xinitrc
ln -s $PWD/.xmodmap $HOME/.xmodmap
ln -s $PWD/.zshrc $HOME/.zshrc

ln -s $PWD/.dircolors $HOME/.dircolors
ln -s $PWD/.zprofile $HOME/.zprofile
cp better-completion.zsh $HOME/.oh-my-zsh/custom/
sudo ln -s $PWD/var-scripts/fe /usr/local/bin/fe
sudo ln -s $PWD/var-scripts/fw /usr/local/bin/fw
chsh -s `which zsh`
