#!/bin/sh
set -e
git clone https://github.com/powerline/fonts.git $HOME/Downloads/powerfonts
pushd $HOME/Downloads/powerfonts/Terminus/PCF
sudo cp ter*pcf.gz /usr/share/fonts/X11/misc
sudo mkfontdir /usr/share/fonts/X11/misc
sudo ftpane /usr/local/bin
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf

