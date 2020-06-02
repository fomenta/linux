#! /bin/bash
# http://ubuntuhandbook.org/index.php/2019/03/install-openshot-2-4-4-ubuntu-18-04-18-10/

echo "Adding PPA for OpenShot"
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt update

echo "Installing...."
sudo apt -y install openshot-qt

# uninstall
#sudo apt-get remove --autoremove openshot-qt
