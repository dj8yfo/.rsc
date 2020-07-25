#!/bin/bash

set -e
source ./__prompt.sh
prompt_install "Preinstall git, generate and add key to the ui"

echo 'Start installing git'
sudo apt install -y git
echo 'Installing xclip and xsel'
sudo apt install -y  xclip xsel
echo 'Generating local key'

ssh-keygen -t rsa -b 4096 -C "sffhox@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -sel clip -i

echo 'Copied the pub key to clipboard...'
echo 'Please enter it on git ui... and press any key...'
read next_key

