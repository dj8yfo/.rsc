#!/bin/bash

dest=/tmp/netkit-install
mkdir $dest
pushd $dest
wget http://wiki.netkit.org/download/netkit/netkit-2.8.tar.bz2
wget http://wiki.netkit.org/download/netkit-filesystem/netkit-filesystem-i386-F5.2.tar.bz2
wget http://wiki.netkit.org/download/netkit-kernel/netkit-kernel-i386-K2.8.tar.bz2
tar -xjSf netkit-2.8.tar.bz2
tar -xjSf netkit-filesystem-i386-F5.2.tar.bz2
tar -xjSf netkit-kernel-i386-K2.8.tar.bz2
mv ./netkit $NETKIT_HOME
popd
rm -rf $dest
sudo apt-get install -y graphviz
