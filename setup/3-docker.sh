#/bin/bash
set -e -u

# uses the script at get.docker.com to install the latest release of Docker Engine - Community on Linux. 
# Alternate approach
# curl -fsSL https://get.docker.com -o get-docker.sh
# sh get-docker.sh


# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository. 
# WARNING: ubuntu 20.x repository not ready ('lsb_release -cs' = focal) - it uses xenial
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#sudo add-apt-repository --remove \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   xenial \
   stable"

# update repo
sudo apt-get update

# install
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

######################################
# use docker without sudo
######################################
sudo groupadd docker
sudo gpasswd -a $USER docker
# activate the changes to groups
newgrp docker

# test docker instalation
docker run hello-world

######################################
# Configure Docker to start on boot
######################################
sudo systemctl enable docker

# To disable this behavior, use disable instead.
#sudo systemctl disable docker


######################################
# Configure the default logging driver
# https://docs.docker.com/config/containers/logging/configure/#configure-the-default-logging-driver
# Enable rotating log files (not by default)
######################################
sudo tee -a /etc/docker/daemon.json <<EOF
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3",
    "labels": "production_status",
    "env": "os,customer"
  }
}
EOF

# no need to restart service
sudo service docker restart
