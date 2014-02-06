#!/bin/bash

USERNAME=rca
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf

# Configure lightdm autologin
if [ -f $LIGHTDM_CONFIG ]; then
    echo "" >> $LIGHTDM_CONFIG
    echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
    echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
fi

# disable screensaver
gsettings set org.gnome.desktop.screensaver lock-delay 3600
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false

# this thing is kinda useless
rm -rf ~/example.desktop

# update the launchers on the dock
gsettings set com.canonical.Unity.Launcher favorites "[ \
    'ubiquity-gtkui.desktop', \
    'nautilus-home.desktop', \
    'firefox.desktop', \
    'gnome-control-center.desktop', \
    'eclipse.desktop', \
    'gnome-terminal.desktop' \
    ]"