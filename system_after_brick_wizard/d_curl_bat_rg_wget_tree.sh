#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Install simple cmd line tools ..."

set -x
sudo apt install apt-file
sudo apt-get install curl wget tree
pushd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
popd


pushd /tmp
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb
popd

sudo apt-get install -y install keepass2
