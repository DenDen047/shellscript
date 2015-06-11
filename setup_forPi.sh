#!bin/bash

echo "creat SymbolicLink"
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.vimrc ~/.vimrc

echo "add Japanese Font"
sudo localedef -f UTF-8 -i ja_JP ja_JP

echo "install softwares..."
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install zsh


echo "update firmware..."
sudo rpi-update
sudo reboot

