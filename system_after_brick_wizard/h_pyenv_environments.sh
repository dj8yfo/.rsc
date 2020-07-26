#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "pyenv environments setup"

set -x
pyenv install 3.8.5
pyenv global 3.8.5
pip install flake8 autoflake
pip install powerline-status
pip install ipython
ipython profile create default
rm $HOME/.ipython/profile_default/ipython_config.py || true
rm $HOME/.config/flake8 || true
rm $HOME/.config/pycodestyle || true
ln -s $PWD/resources/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
ln -s $PWD/resources/flake8 $HOME/.config/flake8
ln -s $PWD/resources/pycodestyle $HOME/.config/pycodestyle
# profile_default
pip install --user pipenv

pyenv install 2.7.14
. ./resources/pylookup_inst.sh

echo 'Next part'
