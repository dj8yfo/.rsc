#!/bin/sh
set -e
set -v
pyenv install 3.8.0b4
pyenv global 3.8.0b4
pip install flake8 autoflake
pip install powerline-status
pip install ipython
ipython profile create default
rm $HOME/.ipython/profile_default/ipython_config.py
ln -s $PWD/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
ln -s $PWD/flake8 $HOME/.config/flake8
ln -s $PWD/pycodestyle $HOME/.config/pycodestyle
# profile_default
pip install --user pipenv
. ./pylookup_inst.sh
pyenv install 2.7.14
pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.8.0b4 neovim3
