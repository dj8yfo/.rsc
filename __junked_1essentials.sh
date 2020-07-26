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





# -------------------- emacs artifacts
mkdir -p $HOME/.docsets
wget -O $HOME/.docsets/C.tgz http://tokyo.kapeli.com/feeds/C.tgz
