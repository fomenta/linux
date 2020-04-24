#!/bin/bash
set -e -u

#
mkdir --parents ~/source/fomenta
cd ~/source/fomenta

#
git clone git@github.com:fomenta/linux.git
cd linux
code .