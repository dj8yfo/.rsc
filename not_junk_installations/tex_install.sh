#!/bin/bash

echo 'starting tex_installation'
softhome=$HOME/Documents/soft
tex_home=$softhome/tex_install
rm -rf $tex_home
mkdir -p $tex_home
wget -O  $tex_home/install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
pushd $tex_home
tar -xf install-tl-unx.tar.gz
cd install-tl-20191113
sudo ./install-tl
popd
