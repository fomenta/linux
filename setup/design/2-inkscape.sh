#! /bin/bash
# http://ubuntuhandbook.org/index.php/2019/01/inkscape-0-92-4-released-install-ubuntu-18-04/

echo "Adding PPA for Inkscape"
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update

echo "Installing...."
sudo apt install -y inkscape

# uninstall
# sudo apt remove --autoremove inkscape
