#!/bin/bash
USERNAME=rca

echo "==> Installing xfce"
apt-get install -y xfce4 slim xubuntu-icon-theme shimmer-themes xfce4-places-plugin

# file manager plugins and better program menu
apt-get install -y thunar-archive-plugin thunar-media-tags-plugin xfce4-whiskermenu-plugin

# install keyboard layout chooser
apt-get install -y xfce4-xkb-plugin

# disable screensaver
echo "mode:off" > ~/.xscreensaver
chown $USERNAME:$USERNAME ~/.xscreensaver

# create special folders like Desktop in home dir, needed later
xdg-user-dirs-update --force

# create ~/.config manually because it does not yet exist
mkdir -p ~/.config
chown $USERNAME:$USERNAME ~/.config
mv ~/xfce4 ~/.config/xfce4

SLIM_CONFIG=/etc/slim.conf

echo "# RCA settings #" >> $SLIM_CONFIG
echo "################" >> $SLIM_CONFIG
echo "numlock on" >> $SLIM_CONFIG
echo "default_user ${USERNAME}" >> $SLIM_CONFIG
echo "auto_login yes" >> $SLIM_CONFIG
