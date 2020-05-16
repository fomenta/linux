#! /bin/bash
#set -e -u

# https://sdkman.io/install

set +e +u

# install sdk man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# install java, gradle, mvn

echo "Installing latest java LTS"
sdk install java 11.0.7-open

echo "Installing Gradle"
sdk install gradle

echo "Installing Maven"
sdk install maven
