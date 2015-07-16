#!/bin/zsh

echo "git setting..."
cd ~/Documents/shellscript/
git pull
cd ~/dotfiles/
git pull

echo "updating..."
sudo apt-get -y update
sudo apt-get -y upgrade
pip install -U pip
