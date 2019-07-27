#!/bin/sh
pyenv install 3.6.4
pyenv global 3.6.4
pip install powerline-status

pyenv install 2.7.14
pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.6.4 neovim3
