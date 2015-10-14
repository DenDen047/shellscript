#!/bin/bash

echo "update..."
sudo apt-get update
sudo apt-get upgrade
echo -e "\n"


echo "install some softwares..."
sudo apt-get install openssh-server
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install tmux
sudo apt-get install ibus-mozc
sudo apt-get install upgrade
sudo apt-get install python2.7 python2.7-dev python-virtualenv
sudo apt-get install python-pygame
sudo apt-get install python-opengl
sudo apt-get install python-numpy python-numpy-doc python-numpy-dbg pyhon-numpydoc
sudo apt-get install ipython
sudo apt-get install wireshark
sudo apt-get install tshark
echo -e "\n"


echo "git setting..."
git config --global user.name "Naoya Muramatsu"
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


echo "SSHkey setting..."
ssh-keygen -t rsa -b 4096 -C "sh.mn.nat@gmail.com"
clip < ~/.ssh/id_rsa.pub
echo -e "\n"
echo "Please paste id_rsa.pub to GitHub"
echo -n "OK? [Y/n] "
read check
ssh -T git@github.com
echo -e "\n"


echo "git clone some directories..."
cd ~/
git clone https://github.com/DenDen047/dotfiles.git
# cd ./shellscript
# git remote add origin https://github.com/DenDen047/shellscript.git
# cd ./dotfiles
# git remote add origin https://github.com/DenDen047/dotfiles.git
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
chsh -s /bin/zsh



# When you need remotedesktop
sudo apt-get install xrdp vnc4serve



echo "Finish!!!"
