# https://h30434.www3.hp.com/t5/Notebook-Wireless-and-Networking/Realtek-8723DE-wifi-module-amp-Bluetooth-Linux-driver/td-p/6477307
# https://github.com/lwfinger/rtlwifi_new/tree/extended


sudo apt-get install linux-headers-generic build-essential git


sudo /bin/sh -c 'echo "options rtl8723de ant_sel=2" >> /etc/modprobe.d/rtl8723de.conf'

git clone https://github.com/lwfinger/rtlwifi_new.git -b extended
cd rtlwifi_new
make
sudo make install
sudo modprobe -r rtl8723de
sudo modprobe rtl8723de

