#! /bin/bash
set -e -u
# https://computingforgeeks.com/install-and-configure-dbeaver-on-ubuntu-debian/


wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

sudo apt update
sudo apt -y  install dbeaver-ce

echo "Checking if installed:"
apt policy dbeaver-ce
