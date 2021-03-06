#!/bin/zsh

echo "\ngit pull..."
shellDir=~/Documents/shellscript/
dotDir=~/dotfiles_forMac/
echo "update shellscript..."
if [ -d $shellDir ]; then
    cd "$shellDir"
    git pull
fi
echo "update dotfiles..."
if [ -d $dotDir ]; then
    cd "$dotDir"
    git pull
fi

sudo tlmgr update --self --all

brew file pull

echo "\nupdating..."
pyenv exec pip install -U pip
brew update
brew upgrade
brew cask update
#apps=($(brew cask list))
#for a in ${apps[@]};do
#  if grep -q "Not installed" < <(brew cask info $a);then
#    brew cask install $a
#  fi
#done

#caskroom="/opt/homebrew-cask/Caskroom"
#apps=($(brew cask list))
#for a in ${apps[@]};do
#  info=$(brew cask info $a)
#  if echo "$info"| grep -q "Not installed";then
#    brew cask install $a
#  fi
#  current=$(echo "$info"|grep "${caskroom}/${a}"|cut -d' ' -f1)
#  for dir in $(ls ${caskroom}/${a});do
#    testdir="${caskroom}/${a}/${dir}"
#    if [ "$testdir" != "$current" ];then
#      rm -rf "$testdir"
#    fi
#  done
#done
#

brew cleanup
brew cask cleanup

echo "\ncleanuping..."
brew prune
brew cleanup
brew cask cleanup

echo "\nchecking..."
brew cask doctor
brew doctor

echo "\nFinish!!\n"

