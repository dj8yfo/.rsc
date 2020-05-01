#!/bin/bash

cp $PWD/cscope-15.9.tar.gz /tmp
pushd /tmp
tar -xf cscope-15.9.tar.gz
pushd ./cscope-15.9
./configure
make
sudo make install
