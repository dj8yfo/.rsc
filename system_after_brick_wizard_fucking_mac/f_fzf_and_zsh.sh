#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Installing zsh and fzf"

set -x

brew install fasd wget rg

rm -rf $HOME/.oh-my-zsh || true
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

rm -rf  $HOME/.fzf || true
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

rm $HOME/.dircolors || true
rm $HOME/.zshrc || true
rm $HOME/.zprofile || true
ln -s $PWD/resources/.dircolors $HOME/.dircolors
ln -s $PWD/resources/.zshrc $HOME/.zshrc
ln -s $PWD/resources/.zprofile $HOME/.zprofile
cp $PWD/resources/better-completion.zsh $HOME/.oh-my-zsh/custom/ || true
sudo ln -s $PWD/resources/var-scripts/fe /usr/local/bin/fe
sudo ln -s $PWD/resources/var-scripts/fw /usr/local/bin/fw

# it's stock zsh anyway
# chsh -s `which zsh`
