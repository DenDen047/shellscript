#!/bin/bash

echo "update..."
sudo apt update
sudo apt upgrade -y
echo -e "\n"


echo "install some softwares..."
sudo apt install -y vim
sudo apt install -y git
sudo apt install -y zsh
sudo apt install -y tmux
echo -e "\n"

echo "install python environment"
sudo apt install -y python3-pip
sudo pip3 install virtualenv


echo "git setting..." git config --global user.name "denden047"
git config --global user.email "sh.mn.nat@gmail.com"
git config --global core.editor 'vim -c "set fenc=utf-8"'	# set vim for default editer
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.precomposeunicode true
git config --local core.precomposeunicode true
git config --global core.quotepath false
echo "=================="
git config --list
echo "=================="
echo -e "\n"


echo "git clone some directories..."
cd $HOME
git clone https://github.com/DenDen047/dotfiles.git
cd ./dotfiles
echo -e "\n"

echo "create symbolic link..."
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ssh/config ~/.ssh/config


# ====== VIM =======
rm -rf ~/dotfiles/.vim/bundle/
mkdir ~/dotfiles/.vim/bundle

# ====== ZSH =======
chsh -s $(which zsh)


# ====== Sublimetext =======
cd ~/Downloads
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text
xdg-open https://packagecontrol.io/installation # for package_control


echo "Finish!!!"
