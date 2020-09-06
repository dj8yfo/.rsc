#!/bin/bash
# run-parts --list --regex '^[a-z].*\.sh' .
set -e
source ./__prompt.sh
prompt_install "Pyenv install"

brew update
brew install pyenv
brew install pyenv-virtualenv
