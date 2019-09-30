#!/bin/sh
set -e
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev
sudo -u sysmanj curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
