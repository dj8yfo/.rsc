#!/bin/bash
sudo -s
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
echo "deb http://build.openvpn.net/debian/openvpn/release/2.4 bionic main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
sudo apt update
sudo apt-get install -y openvpn
sudo apt-get install -y network-manager-openvpn-gnome
#   https://github.com/NicolasGuilloux/KGet-Integrator
# awesome download manager
