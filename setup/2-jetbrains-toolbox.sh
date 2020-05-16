#!/bin/bash
# https://gist.github.com/greeflas/431bc50c23532eee8a7d6c1d603f3921
set -e

if [ -d ~/.local/share/JetBrains/Toolbox ]; then
    echo "JetBrains Toolbox is already installed!"
    exit 0
fi

echo -e " \e[94mInstalling Jetbrains Toolbox\e[39m"

function getLatestUrl() {
    USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')

    URL=$(curl 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
    echo $URL
}
getLatestUrl

FILE=$(basename ${URL})
DOWNLOAD_PATH=$HOME/Downloads/$FILE

echo ""
echo -e "\e[94mDownloading Toolbox files \e[39m"
echo ""
wget -cO  ${DOWNLOAD_PATH} ${URL} --read-timeout=5 --tries=0
echo ""
echo -e "\e[32mDownload complete!\e[39m"
echo ""


TOOLBOX_TEMP_DIR=$(mktemp -d)

echo "Unzip temporary folder: ${TOOLBOX_TEMP_DIR}"
tar -C "$TOOLBOX_TEMP_DIR" -xf ${DOWNLOAD_PATH}
echo "Deleting downloaded file"
rm ${DOWNLOAD_PATH}

echo "Installing..."
"$TOOLBOX_TEMP_DIR"/*/jetbrains-toolbox

echo "Deleting temporary folder..."
rm -r "$TOOLBOX_TEMP_DIR"

echo "JetBrains Toolbox was successfully installed!"
