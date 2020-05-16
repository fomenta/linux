#!/bin/bash
set -e -u

# TODO: make sure to set this variable outside this script
#$EMAIL="your-email@domain.com"
#
# general: xclip
# git uses: git
# code uses: curl apt-transport-https
sudo apt install git xclip curl apt-transport-https -y

# grub customizer (ubuntu 18.x)
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer -y
# to remove
# sudo apt-get remove --autoremove grub-customizer


# ssh key for github
cd
mkdir .ssh && cd $_
ssh-keygen -t rsa  -C $EMAIL -f ~/.ssh/id_rsa -N ""
xclip -selection clipboard < ~/.ssh/id_rsa.pub

echo "Opening https://github.com/settings/keys"
echo 'Click on "New SSH key" button...'
xdg-open https://github.com/settings/keys


echo "Visual Studio Code"
# https://code.visualstudio.com/docs/setup/linux

# The repository and key can also be installed manually with the following script:
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'


# Then update the package cache and install the package using:
sudo apt-get update

# install
sudo apt-get install code -y

# Setting VS Code as the default text editor

xdg-mime default code.desktop text/plain
