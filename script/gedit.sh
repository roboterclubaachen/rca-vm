#!/bin/bash
# gedit settings
SETTINGS=$(cat <<EOF
org.gnome.gedit.preferences.editor display-right-margin true
org.gnome.gedit.preferences.editor highlight-current-line true
org.gnome.gedit.preferences.editor bracket-matching true
org.gnome.gedit.preferences.editor scheme 'oblivion'
org.gnome.gedit.preferences.editor tabs-size 4
org.gnome.gedit.preferences.editor display-line-numbers true
org.gnome.gedit.preferences.editor wrap-mode 'none'
org.gnome.gedit.plugins active-plugins ['docinfo','modelines','filebrowser','spell','time','drawspaces']
EOF
)
# Install the gedit texteditor
sudo apt-get install -y gedit gedit-plugins libglib2.0-bin
#set user settings
while read -r line; do
	gsettings set $line
done <<< "$SETTINGS"

# xpcc template highlighting
wget https://raw.githubusercontent.com/roboterclubaachen/xpcc/develop/tools/syntax-highlighter/gtksourceview/in.lang
sudo mv in.lang /usr/share/gtksourceview-3.0/language-specs/in.lang
