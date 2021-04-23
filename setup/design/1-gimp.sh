#! /bin/bash
# https://tecadmin.net/install-gimp-on-ubuntu/

echo "Adding PPA for GIMP"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update

echo "Installing...."
# WARNING: still not working
sudo apt -y install libgimp2.0 libgegl-0.4-0

sudo apt -y install gimp

# uninstall
#sudo apt-get autoremove gimp gimp-plugin-registry
