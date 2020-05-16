#!/bin/bash
set -e -u

#
mkdir --parents ~/source/fomenta
cd ~/source/fomenta

#
git clone git@github.com:fomenta/linux.git
git clone git@github.com:fomenta/codesamples.git


cd linux
code .

echo "Configure your default git user:"
echo git config --global user.email \"you@example.com\"
echo git config --global user.name \"Your Name\"
