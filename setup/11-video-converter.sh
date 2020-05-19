#! /bin/bash
# https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases

echo "Adding PPA"
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update

echo "Installing..."
# HandBrake gtk gui and cli
sudo apt-get install -y handbrake-gtk handbrake-cli
