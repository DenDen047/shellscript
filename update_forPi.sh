#!/bin/bash

echo "git setting..."
cd ~/shellscript/
git pull

echo "updating..."
sudo apt-get -y update
sudo apt-get -y upgrade


