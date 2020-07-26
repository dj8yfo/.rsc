#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Emacs install..."

sudo apt-get install -y librsvg2-dev
sudo apt-get install -y libjpeg8-dev libgif-dev libtiff-dev libgnutls28-dev mailutils
sudo apt-get install -y libxaw7-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y wordnet
dest_d=$HOME/Documents/soft/emacs-install
mkdir -p $dest_d

wget -O $dest_d/emacs-26.3.tar.xz http://ftp.gnu.org/gnu/emacs/emacs-26.3.tar.xz
pushd $dest_d
tar -xf emacs-26.3.tar.xz
pushd emacs-26.3
./configure --with-x-toolkit=lucid --with-modules
make
sudo make install
popd
rm emacs-26.3.tar.xz
popd
sylbnr_home=$HOME/.emacs.d
git clone https://github.com/syl20bnr/spacemacs $sylbnr_home
pushd $sylbnr_home
git checkout develop
rm -rf private
my_spacemacs=$HOME/Documents/.spacemacs
git clone git@github.com:dj8yfo/.spacemacs.git $my_spacemacs
ln -s $my_spacemacs/private $sylbnr_home/private || true
ln -s $my_spacemacs/.spacemacs $HOME/.spacemacs || true
echo "LINKS established:"
ls -l $sylbnr_home/private
ls -l $HOME/.spacemacs
popd
emacs --version
notes_dir=$HOME/Documents/code/tasking
rm -rf $notes_dir || true
git clone git@github.com:dj8yfo/tasking.git $notes_dir

sudo cp ./resources/var-scripts/wd /usr/local/bin
sudo chmod +x /usr/local/bin/wd

sudo apt-get install -y shellcheck
pip install bashate

echo 'Next part'
