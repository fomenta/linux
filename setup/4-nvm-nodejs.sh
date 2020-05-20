#! /bin/bash
# Node Version Manager
# https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "Activating nvm..."
# => Close and reopen your terminal to start using nvm or run the following to use it now:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

set -e
echo "Checking nvm version..."
nvm --version

echo "Installing latest node LTS..."
nvm install --lts
echo "Installing npm..."
nvm install-latest-npm

echo "node version..."
node --version

echo "npm version..."
npm --version

# Let’s install two more versions, the latest LTS version and version 8.10.0
# nvm install node   # latest (non-LTS)
# nvm install --lts
# nvm install 8.10.0
# 
# To list installed Node.js versions type:
# nvm ls
#
# You can change the currently active version with:
# nvm use 10.16.3
#
# Now using node v10.16.3 (npm v6.9.0)
# If you want to change the default Node.js version use the following command:
#
# nvm alias default 10.16.3
