#! /bin/bash
set -e -u

# https://www.eclipse.org/downloads/packages/
run-installer() {
    set -e -u
    cd ~/Downloads
    tar -xvzf ~/Downloads/eclipse-inst-linux64.tar.gz

    cd eclipse-installer
    ./eclipse-inst
}

# Inspired by:
# https://gist.github.com/excitedleigh/1071034/7b14237957767119c0f23867ef5a3af6ae93522d
create-shortcut() {
    set -e -u
    eclipse_bin="#!/bin/sh
export ECLIPSE_HOME='/home/pablo/eclipse/java-2020-03/eclipse'
\$ECLIPSE_HOME/eclipse \$*"

eclipse_desktop="[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Comment=Eclipse IDE
Exec=eclipse
Icon=/home/pablo/eclipse/java-2020-03/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true"

    # cleanup
    #sudo rm /usr/bin/eclipse
    #sudo rm /usr/share/applications/eclipse.desktop
    
    sudo touch /usr/bin/eclipse
    sudo chmod 755 /usr/bin/eclipse
    echo -e "$eclipse_bin" | sudo tee /usr/bin/eclipse
    echo -e "$eclipse_desktop" | sudo tee /usr/share/applications/eclipse.desktop
}


#run-installer
create-shortcut
