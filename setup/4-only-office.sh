#!/bin/bash
set -e -u

# https://www.tecrobust.com/install-onlyoffice-for-ubuntu/#1

# Add OnlyOffice GPG Key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5

sudo sh -c 'echo "deb http://download.onlyoffice.com/repo/debian squeeze main" > /etc/apt/sources.list.d/onlyoffice.list'

# Then update the package cache and install the package using:
sudo apt update

sudo apt install -y onlyoffice-desktopeditors
