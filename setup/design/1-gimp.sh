#! /bin/bash
# https://tecadmin.net/install-gimp-on-ubuntu/

echo "Adding PPA for GIMP"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update

echo "Installing...."
sudo apt -y install gimp

# uninstall
#sudo apt-get autoremove gimp gimp-plugin-registry
