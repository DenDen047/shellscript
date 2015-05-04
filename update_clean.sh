#!/bin/zsh

echo "updating..."
brew update
brew upgrade
brew cask update

echo "cleanuping..."
brew cleanup
brew cask cleanup

echo "checking..."
brew doctor

echo "Finish!!"
