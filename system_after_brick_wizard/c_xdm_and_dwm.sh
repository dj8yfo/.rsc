#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Install xdm and dwm ..."


set -x
sudo apt-get update -y
sudo apt-get install xfce4-volumed

sudo apt-get install -y build-essential
echo 'Cloning configs for Xorg...'

for name in .bashrc .xinitrc .xmodmap .xsession
do
	rm $HOME/$name || true;
done
ln -s $PWD/resources/.bashrc $HOME/.bashrc
ln -s $PWD/resources/.xinitrc $HOME/.xinitrc

# ------------- come back, if you need to -----------
# sudo apt install ubuntu-session gdm3
# sudo dpkg-reconfigure gdm3
ln -s $PWD/resources/.xsession $HOME/.xsession

ln -s $PWD/resources/.xmodmap $HOME/.xmodmap
sudo rm /etc/default/keyboard
sudo cp $PWD/resources/def_keyboard /etc/default/keyboard

sudo apt-get install -y suckless-tools xdm dmenu xorg libx11-dev libxft-dev libxinerama-dev
pushd /tmp
rm -rf dwm || true
git clone  https://github.com/dj8yfo/dwm.git
pushd dwm
git checkout prev
sudo make clean install
popd
popd


prompt_install "Restart system now?"
shutdown -r 0
