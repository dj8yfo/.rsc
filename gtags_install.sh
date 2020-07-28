#!/bin/bash
sudo apt-get update
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
