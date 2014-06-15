
# disable screensaver
dbus-launch --auto-syntax gsettings set org.gnome.desktop.screensaver lock-delay 3600
dbus-launch --auto-syntax gsettings set org.gnome.desktop.screensaver lock-enabled false
dbus-launch --auto-syntax gsettings set org.gnome.desktop.screensaver idle-activation-enabled false

# set german and us keyboard layout
dbus-launch --auto-syntax gsettings set org.gnome.libgnomekbd.keyboard layouts \
"['de', 'us']"

# update the launchers on the dock