#!/bin/bash
set -x
set -e
source ./__prompt.sh
prompt_install "gtags install"

sudo apt-get update
sudo apt install -y \
     gcc make \
     pkg-config autoconf automake \
     python3-docutils \
     libseccomp-dev \
     libjansson-dev \
     libyaml-dev \
     libxml2-dev
pushd /tmp
echo "installing ctags (Universal ctags)"
git clone https://github.com/universal-ctags/ctags.git
pushd ctags
./autogen.sh
./configure
make
sudo make install
popd
popd

sudo apt-get -y install ncurses-dev

pushd /tmp
echo "install GNU global..."
wget http://tamacom.com/global/global-6.5.6.tar.gz
tar zxvf global-6.5.6.tar.gz
cd global-6.5.6
./configure
make
sudo make install
popd

echo "install pygments..."
pip install pygments
