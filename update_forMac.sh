#!/bin/zsh

echo "\ngit pull..."
shellDir=~/Documents/shellscript/
dotDir=~/dotfiles_forMac/
toolDir=~/Documents/Tools/
if [ -d $shellDir ]; then
    cd "$shellDir"
    git pull
fi
if [ -d $dotDir ]; then
    cd "$dotDir"
    git pull
fi
if [ -d $toolDir ]; then
    cd "$toolDir"
    git pull
fi
brew file pull

echo "\nupdating..."
pip install -U pip
brew update
brew upgrade --all
brew cask update

echo "\ncleanuping..."
brew cleanup
brew cask cleanup

echo "\nchecking..."
brew cask doctor
brew doctor

echo "\nFinish!!\n"
