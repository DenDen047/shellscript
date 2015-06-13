#!/bin/zsh

echo "git pull..."
#cd ~/Document/shellscript/
#git pull

shellDir=~/Documents/shellscript/
if [ -d $shellDir ]; then
    cd "$shellDir"
    git pull
fi

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
