#!/bin/bash
set -e
softhome=$HOME/Documents/soft
alacrity_home=$softhome/alacritty
git clone https://github.com/jwilm/alacritty.git $alacrity_home
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev

pushd $alacrity_home
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
popd

rm $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
