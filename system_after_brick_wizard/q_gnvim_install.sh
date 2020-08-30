#!/bin/bash
set -x
set -e
source ./__prompt.sh
prompt_install "gnvim  install"

sudo apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev
pushd /tmp
git clone https://github.com/vhakulinen/gnvim.git
pushd gnvim
make
sudo make install

popd
popd
