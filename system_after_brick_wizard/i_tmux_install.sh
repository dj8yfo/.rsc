#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "tmux install"
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
pushd /tmp
rm -rf tmux-2.9a || true
wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz
tar -xzf tmux-2.9a.tar.gz
pushd tmux-2.9a
sudo apt-get install automake
./configure && make
sudo make install
popd

popd
ln -s $PWD/resources/.tmux-pane.conf $HOME/.tmux-pane.conf || true
ln -s $PWD/resources/.tmux.conf $HOME/.tmux.conf || true

sudo cp ./resources/ftpane /usr/local/bin || true
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack

echo 'Next part'
