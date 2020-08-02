#!/bin/bash
set -x
set -e
source ./__prompt.sh
prompt_install "surfraw install"

mkdir -p ${HOME}/.config/surfraw/elvi
cp ./resources/surfraw_elvis/* ${HOME}/.config/surfraw/elvi
pushd /tmp
rm -rf menu-surfraw
git clone https://github.com/TomboFry/menu-surfraw.git
pushd menu-surfraw
sudo cp menu-surfraw /usr/local/bin
sudo apt install -y rofi
sudo apt-get install -y surfraw

popd
popd
