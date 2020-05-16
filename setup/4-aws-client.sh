#! /bin/bash
set -e -u

# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

cd ~/Downloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws --version
rm awscliv2.zip
rm -rf aws
