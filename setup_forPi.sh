#!bin/bash

echo "creat SymbolicLink"
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "add Japanese Font"
sudo localedef -f UTF-8 -i ja_JP ja_JP
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


echo "install softwares..."
sudo apt-apt update
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install zsh
sudo apt-get install tree
sudo apt-get install apache2

# install MJPG-streamer
# reference URL -> http://www.hiramine.com/physicalcomputing/raspberrypi/webcamstreaming.html
sudo apt-get install subversion libjpeg-dev imagemagick
svn co https://svn.code.sf.net/p/mjpg-streamer/code/mjpg-streamer mjpg-streamer
cd mjpg-streamer
make

echo "update firmware..."
sudo rpi-update
sudo reboot

