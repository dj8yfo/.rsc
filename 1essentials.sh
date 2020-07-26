#!/bin/bash
#set -e

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get install neovim

# -------------------------------

sudo cp ./var-scripts/days-between /usr/local/bin
sudo chmod +x /usr/local/bin/days-between

sudo cp ./var-scripts/alarmsequence /usr/local/bin
sudo chmod +x /usr/local/bin/alarmsequence

sudo cp ./var-scripts/set-bri /usr/local/bin
sudo chmod +x /usr/local/bin/set-bri

# -------------------------------


pushd /tmp
git clone https://github.com/TomboFry/menu-surfraw.git
pushd menu-surfraw
sudo cp menu-surfraw /usr/local/bin
sudo apt install -y rofi
sudo apt-get install -y surfraw
popd
# -------------------------------

sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


ln -s $PWD/.dircolors $HOME/.dircolors
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.zprofile $HOME/.zprofile
cp better-completion.zsh $HOME/.oh-my-zsh/custom/
sudo ln -s $PWD/resources/var-scripts/fe /usr/local/bin/fe
sudo ln -s $PWD/resources/var-scripts/fw /usr/local/bin/fw

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
chsh -s `which zsh`


# -------------------- emacs artifacts
mkdir -p $HOME/.docsets
wget -O $HOME/.docsets/C.tgz http://tokyo.kapeli.com/feeds/C.tgz
