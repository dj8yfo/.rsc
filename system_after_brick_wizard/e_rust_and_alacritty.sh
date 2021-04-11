#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Install rust and alacritty... ?"

set -x
sudo apt-get install -y xfonts-terminus console-terminus

#rustup
which curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
softhome=$HOME/Documents/soft
mkdir -p $softhome
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
cargo install rusty-man

. ./resources/alacritty_install.sh
echo 'Alacritty installed...'
