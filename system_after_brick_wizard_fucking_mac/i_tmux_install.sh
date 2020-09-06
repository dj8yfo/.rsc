#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "tmux install"
brew install tmux

ln -s $PWD/resources/.tmux-pane.conf $HOME/.tmux-pane.conf || true
ln -s $PWD/resources/.tmux.conf $HOME/.tmux.conf || true

sudo cp ./resources/ftpane /usr/local/bin || true
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.tmux-themepack

echo 'Next part'
