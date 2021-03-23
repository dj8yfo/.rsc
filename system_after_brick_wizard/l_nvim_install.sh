#!/bin/bash
set -e
set -x
source ./__prompt.sh
prompt_install "nvim installation"

pyenv virtualenv 2.7.14 neovim2 || true
pyenv virtualenv 3.8.5 neovim3 || true

# sudo add-apt-repository -y ppa:neovim-ppa/unstable
# sudo apt-get -y install neovim

rm -rf $HOME/Documents/nvim || true
sudo rm -rf /usr/local/bin/nvim-linux64 || true
mkdir -p $HOME/Documents/nvim
pushd $HOME/Documents/nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
sudo cp -rv nvim-linux64 /usr/local/bin/
popd

sudo apt-get install -y libboost-all-dev cmake libicu-dev
sudo -u hypen9 rm -rf ~/.config/nvim
sudo -u hypen9 git clone git@github.com:dj8yfo/.vimrc.git ~/.config/nvim

echo "nvim done"
