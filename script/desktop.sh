#!/bin/bash

echo "==> Installing xubunutu-desktop"
apt-get install -y xubuntu-desktop
#apt-get install -y ubuntu-desktop

USERNAME=rca
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=vagrant" >> $GDM_CUSTOM_CONFIG

echo "==> Configuring lightdm autologin"
#if [ -f $LIGHTDM_CONFIG ]; then
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
#fi

# install the virtualbox guest additions
sudo apt-get install -y virtualbox-guest-additions

# this thing is kinda useless
rm -rf ~/examples.desktop