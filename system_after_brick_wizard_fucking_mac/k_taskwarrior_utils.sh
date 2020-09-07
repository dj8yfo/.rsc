#!/bin/bash
set -e
source ./__prompt.sh
prompt_install "taskwarrior install..."

brew install ranger
ranger --copy-config=all

rm -rf $HOME/.config/ranger || true
ln -s $PWD/subconfs/ranger $HOME/.config/ranger || true

notes_dir=$HOME/Documents/code/tasking
rm -rf $notes_dir || true
git clone git@github.com:dj8yfo/tasking.git $notes_dir

brew install task cpanminus clog gawk
rm -rf $HOME/.task
ln -s $HOME/Documents/code/tasking/.task.d $HOME/.task
rm -rf $HOME/tasknotes
ln -s $HOME/Documents/code/tasking/.tasknotes.d $HOME/tasknotes

rm -rf /tmp/taskopen || true
git clone https://github.com/ValiValpas/taskopen.git /tmp/taskopen
pushd /tmp/taskopen
sudo make PREFIX=/usr/local install
popd
rm $HOME/.taskrc
ln -s $PWD/taskconfigs/.taskrc $HOME/.taskrc

rm $HOME/.taskopenrc
ln -s $PWD/taskconfigs/.taskopenrc $HOME/.taskopenrc
rm $HOME/.taskopenrc1
ln -s $PWD/taskconfigs/.taskopenrc1 $HOME/.taskopenrc1
sudo cpanm install JSON


brew install vifm
sudo cp ./resources/var-scripts/attach_vifm /usr/local/bin
sudo chmod +x /usr/local/bin/attach_vifm

sudo cp ./resources/var-scripts/xcat /usr/local/bin
sudo cp ./resources/var-scripts/xbat /usr/local/bin
sudo chmod +x /usr/local/bin/xcat

mkdir -p $HOME/.config/tridactyl
# ln -s $PWD/resources/tridactylrc $HOME/.config/tridactyl/tridactylrc
sudo cp ./resources/var-scripts/gitpush /usr/local/bin
sudo chmod +x /usr/local/bin/gitpush
