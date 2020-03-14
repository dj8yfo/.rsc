#!/bin/bash
sudo -s
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg |sudo apt-key add -
sudo add-apt-repository \
        "deb [arch=amd64] https://build.openvpn.net/debian/openvpn/release/2.4 \
        $(lsb_release -cs) \
        main"
sudo apt update
sudo apt-get install -y openvpn
sudo apt-get install -y network-manager-openvpn-gnome
#   https://github.com/NicolasGuilloux/KGet-Integrator
# awesome download manager
