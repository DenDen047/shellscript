#!/bin/bash

echo "git setting..."
cd ~/shellscript/
git pull
cd ~/Tools/
git pull
cd ~/dotfiles/
git pull

echo "updating..."
sudo apt-get -y update
sudo apt-get -y upgrade
pip install -U pip



