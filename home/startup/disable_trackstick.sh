#!/bin/sh
# cd ~
# mkdir startup && cd startup
# sudo chmod +x disable_trackstick.sh

echo "Disabling Trackstick..."
# find non-microsoft mouse
deviceName=$(xinput | awk '/Mouse/ && !/Microsoft/' | grep -Po '(?<=↳\ ).+?(?=\s*id=)')
#echo "'$deviceName'"

xinput disable "$deviceName"
