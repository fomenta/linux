#!/bin/bash
set -e -u

# https://docs.docker.com/compose/install/

# Run this command to download the current stable release of Docker Compose:

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# To install a different version of Compose, substitute 1.25.5 with the version of Compose you want to use.

# Apply executable permissions to the binary:

sudo chmod +x /usr/local/bin/docker-compose

# check version
docker-compose --version
