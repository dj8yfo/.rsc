#!/bin/sh
set -e
set -v
pyenv install 3.8.0b4
pyenv global 3.8.0b4
pip install powerline-status

pyenv install 2.7.14
pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.8.0b4 neovim3
