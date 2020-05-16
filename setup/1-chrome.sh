#!/bin/bash
set -e -u
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

cd ~/Downloads
wget https://dl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub
rm linux_signing_key.pub

# Then update the package cache and install the package using:
sudo apt-get update

sudo apt install google-chrome-stable -y

# open it
#google-chrome-stable
