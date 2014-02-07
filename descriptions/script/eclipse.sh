VAGRANT_USER=rca

echo "download and expand eclipse"
curl http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/kepler/SR1/eclipse-cpp-kepler-SR1-linux-gtk-x86_64.tar.gz \
    -o eclipse.tar.gz
tar -xvzf eclipse.tar.gz
rm eclipse.tar.gz

echo "installing eclipse to location"
mv eclipse /opt
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /opt/eclipse
chmod a+x /usr/bin/eclipse-nice.sh

echo "set workspace manually"
mkdir /opt/eclipse/configuration/.settings
cd /opt/eclipse/configuration/.settings
sh -c 'echo "MAX_RECENT_WORKSPACES=5" > org.eclipse.ui.ide.prefs'
sh -c 'echo "RECENT_WORKSPACES=/home/rca/workspace" >> org.eclipse.ui.ide.prefs'
sh -c 'echo "RECENT_WORKSPACES_PROTOCOL=3" >> org.eclipse.ui.ide.prefs'
sh -c 'echo "SHOW_WORKSPACE_SELECTION_DIALOG=false" >> org.eclipse.ui.ide.prefs'
sh -c 'echo "eclipse.preferences.version=1" >> org.eclipse.ui.ide.prefs'
chown -R $VAGRANT_USER /opt/eclipse/configuration/.settings
cd

# We are installing the following plug-ins:
#   - Eclipse Java Development Tools
#   - PyDev for Eclipse
#   - Eclipse Xml Editors and Tools
#   - Eclipse Swing Designer
echo "install the required eclipse plug-ins"
/opt/eclipse/eclipse \
-application org.eclipse.equinox.p2.director \
-noSplash \
-repository \
http://download.eclipse.org/releases/kepler,\
http://pydev.org/updates \
-installIUs \
org.eclipse.jdt.feature.group,\
org.python.pydev.feature.feature.group,\
org.eclipse.wst.xml_ui.feature.feature.group,\
org.eclipse.wb.swing.feature.feature.group
