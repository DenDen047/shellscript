#!/bin/zsh

echo "apt-get update..."
sudo apt-get update
sudo apt-get upgrade

echo "install software for server..."
sudo apt-get install apache2
sudo apt-get install php5 libapache2-mod-php5

