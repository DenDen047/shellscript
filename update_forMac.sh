#!/bin/zsh

echo "git pull..."
shellDir=~/Documents/shellscript/
dotDir=~/dotfiles/
if [ -d $shellDir ]; then
    cd "$shellDir"
    git pull
fi
if [ -d $dotfiles ]; then
    cd "$dotfiles"
    git pull
fi
brew file pull

echo "updating..."
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
