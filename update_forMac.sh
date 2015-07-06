#!/bin/zsh

echo "git pull..."
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

echo "updating..."
pip install -U pip
brew update
brew upgrade --all
brew cask update

echo "cleanuping..."
brew cleanup
brew cask cleanup

echo "checking..."
brew cask doctor
brew doctor

echo "Finish!!"
