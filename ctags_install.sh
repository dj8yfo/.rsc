#!/bin/bash
sudo apt install \
        gcc make \
        pkg-config autoconf automake \
        python3-docutils \
        libseccomp-dev \
        libjansson-dev \
        libyaml-dev \
        libxml2-dev
pushd /tmp
git clone https://github.com/universal-ctags/ctags.git
pushd ctags
./autogen.sh
./configure
make
sudo make install
popd
popd
