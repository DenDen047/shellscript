#!/bin/bash

echo "install softwares..."
sudo apt-get update
sudo apt-get install -y tree
sudo apt-get install -y vim
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y tree
sudo apt-get install -y rtorrent
sudo apt-get install -y apache2
sudo apt-get install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt-get install -y libfreeimage3 libfreeimage-dev
sudo apt-get install -y ipython
sudo apt-get install -y usbmount
sudo apt-get install -y jfbterm uim uim-anthy
sudo apt-get install -y convmv
sudo apt-get install -y ttf-kochi-gothic xfonts-intl-japanese xfonts-intl-japanese-big xfonts-kaname
sudo apt-get install -y task-japanese task-japanese-desktop

echo "install pyenv..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

mkdir ~/Downloads

echo "SSHkey setting..."
ssh-keygen -t rsa -b 4096 -C "sh.mn.nat@gmail.com"
echo ~/.ssh/id_rsa.pub
echo -e "\n"
echo "Please paste id_rsa.pub to GitHub"
echo -n "OK? [Y/n] "
read check
ssh -T git@github.com
echo -e "\n"


echo "git clone some directories..."
cd ~/
git clone https://github.com/DenDen047/dotfiles.git
echo -e "\n"


echo "creat SymbolicLink"
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ssh/config ~/.ssh/config

echo "add Japanese Font"
# sudo localedef -f UTF-8 -i ja_JP ja_JP
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

echo "create symbolic link..."


# ====== VIM =======
rm -rf ~/dotfiles/.vim/bundle/
mkdir ~/dotfiles/.vim/bundle

# ====== ZSH =======
chsh -s /bin/zsh

echo "update firmware..."
sudo rpi-update
sudo reboot

