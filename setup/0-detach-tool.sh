#!/bin/bash
set -e -u

#http://inglorion.net/software/detach/

URL=http://inglorion.net/download/detach-0.2.3.tar.bz2
FILE=$(basename "$URL")
DOWNLOAD_PATH=$HOME/Downloads/$FILE
TARGET_DIR="$( echo "${FILE%.*.*}" )"

cd $HOME/Downloads
wget -cO "$DOWNLOAD_PATH" "$URL" --read-timeout=5 --tries=0

tar xjf "$DOWNLOAD_PATH"
cd "$TARGET_DIR"
make

echo "Installing (sudo required)..."
sudo make install

echo "Deleting downloaded files..."
cd ..
rm -rf "$TARGET_DIR"
rm -f "$FILE"
