#!/bin/sh
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
alacrity_home=$softhome/alacritty
git clone https://github.com/jwilm/alacritty.git $alacrity_home
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev

pushd $alacrity_home
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/alacritty.desktop
sudo update-desktop-database
popd
sudo cp ./var-scripts/days-between /usr/local/bin
sudo chmod +x /usr/local/bin/days-between

sudo cp ./var-scripts/alarmsequence /usr/local/bin
sudo chmod +x /usr/local/bin/alarmsequence

# sudo add-apt-repository -y ppa:mmstick76/alacritty
# sudo apt-get install -y alacritty
rm $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
sudo apt-get install zsh
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
