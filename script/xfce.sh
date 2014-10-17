#!/bin/bash

echo "==> Installing xfce"
apt-get install -y xfce4 slim xubuntu-icon-theme shimmer-themes xfce4-places-plugin

# file manager plugins and better program menu
apt-get install -y thunar-archive-plugin thunar-media-tags-plugin xfce4-whiskermenu-plugin

# install keyboard layout chooser
apt-get install -y xfce4-xkb-plugin

# move backround image to backgrounds directory
mv wallpaper_captain.jpg /usr/share/backgrounds/xfce/

# disable screensaver
echo "mode:off" > ~/.xscreensaver

mv ~/xfce4 .config/

USERNAME=rca
SLIM_CONFIG=/etc/slim.conf

echo "# RCA settings #" >> $SLIM_CONFIG
echo "################" >> $SLIM_CONFIG
echo "numlock on" >> $SLIM_CONFIG
echo "default_user ${USERNAME}" >> $SLIM_CONFIG
echo "auto_login yes" >> $SLIM_CONFIG
