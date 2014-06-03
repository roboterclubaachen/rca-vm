#!/bin/bash

USERNAME=rca
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf

# Configure lightdm autologin
if [ -f $LIGHTDM_CONFIG ]; then
    echo "" >> $LIGHTDM_CONFIG
    echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
    echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
fi

# install the virtualbox guest additions
sudo apt-get install -y virtualbox-guest-additions

# this thing is kinda useless
rm -rf ~/examples.desktop