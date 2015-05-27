#!/bin/zsh

echo "git pull..."
cd ~/Document/shellscript/
git pull

echo "updating..."
brew update
brew upgrade --all
brew cask update

echo "cleanuping..."
brew cleanup
brew cask cleanup

echo "checking..."
brew doctor

echo "Finish!!"
