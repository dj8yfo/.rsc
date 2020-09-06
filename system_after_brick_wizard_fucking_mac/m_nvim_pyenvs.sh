#!/bin/zsh
set -e
set -x
source ./__prompt.sh
prompt_install "nvim pyenvironments setup"
set +x
pyenv activate neovim2
pip install neovim
pip install pynvim
pip install jupyter
pyenv deactivate

pyenv activate neovim3
pip install neovim
pip install pynvim
pip install jupyter
pip install urllib3
pyenv deactivate

