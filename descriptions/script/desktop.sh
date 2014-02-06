#!/bin/bash

USERNAME=rca
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf

# Configure lightdm autologin.

if [ -f $LIGHTDM_CONFIG ]; then
    echo "" >> $LIGHTDM_CONFIG
    echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
    echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
fi

# disable screensaver

gsettings set org.gnome.desktop.screensaver lock-delay 3600
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false