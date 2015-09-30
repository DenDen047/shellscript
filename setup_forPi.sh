#!bin/bash

echo "creat SymbolicLink"
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.vimrc ~/.vimrc
rm -rf ~/dotfiles/.vim/double/
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "add Japanese Font"
# sudo localedef -f UTF-8 -i ja_JP ja_JP
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8


echo "install softwares..."
sudo apt-get update
sudo apt-get install tree
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install zsh
sudo apt-get install tree
sudo apt-get install rtorrent
sudo apt-get install apache2
sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt-get install libfreeimage3 libfreeimage-dev
sudo apt-get install ipython
sudo apt-get install usbmount
sudo apt-get install jfbterm uim uim-anthy
sudo apt-get install convmv
sudo apt-get install ttf-kochi-gothic xfonts-intl-japanese xfonts-intl-japanese-big xfonts-kaname
sudo apt-get install task-japanese task-japanese-desktop

echo "install pyenv..."
echo "http://qiita.com/akito1986/items/be5dcd1a502aaf22010b"
cd /usr/local/
sudo git clone git://github.com/yyuu/pyenv.git ./pyenv
sudo mkdir -p ./pyenv/versions ./pyenv/shims
cd /usr/local/pyenv/plugins/
sudo git clone git://github.com/yyuu/pyenv-virtualenv.git
echo 'export PYENV_ROOT="/usr/local/pyenv"' | sudo tee -a /etc/profile.d/pyenv.sh
echo 'export PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"' | sudo tee -a /etc/profile.d/pyenv.sh
source /etc/profile.d/pyenv.sh

mkdir ~/Downloads

# install MJPG-streamer
# reference URL -> http://www.hiramine.com/physicalcomputing/raspberrypi/webcamstreaming.html
sudo apt-get install subversion libjpeg-dev imagemagick
svn co https://svn.code.sf.net/p/mjpg-streamer/code/mjpg-streamer mjpg-streamer
cd mjpg-streamer
make

echo "update firmware..."
sudo rpi-update
sudo reboot

