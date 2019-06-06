#!/bin/sh
# cd ~
# mkdir startup && cd startup
# sudo chmod +x disable_trackpad.sh

echo "Disabling Trackpad..."
# find non-microsoft mouse
deviceName=$(xinput | awk '/Touchpad/' | grep -Po '(?<=↳\ ).+?(?=\s*id=)')
#echo "'$deviceName'"

xinput disable "$deviceName"
