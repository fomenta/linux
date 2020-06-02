#! /bin/bash
# http://ubuntuhandbook.org/index.php/2019/02/obs-studio-23-0-released/

echo "Adding PPA for Screen Recorder (OBS Studio)"
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update

echo "Installing...."
sudo apt -y install obs-studio

# uninstall
#sudo apt-get remove --autoremove obs-studio
