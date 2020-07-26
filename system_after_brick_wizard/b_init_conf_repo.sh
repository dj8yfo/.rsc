#!/bin/bash

set -e
source ./__prompt.sh
prompt_install "clone this repo to Documents/.conf ??"
git clone git@github.com:dj8yfo/.rsc.git $HOME/Documents/.conf

