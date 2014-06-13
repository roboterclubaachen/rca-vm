VAGRANT_USER=rca

echo "==> download and expand eclipse"
curl http://ftp.wh2.tu-dresden.de/pub/mirrors/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-cpp-kepler-SR2-linux-gtk-x86_64.tar.gz \
    -o eclipse.tar.gz
tar -xvzf eclipse.tar.gz
rm eclipse.tar.gz

echo "==> installing eclipse to location"
mv eclipse /opt
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /opt/eclipse
chmod a+x /usr/bin/eclipse-nice.sh

# this is a really evil hack
ECLIPSE_FOLDER_NAME=org.eclipse.platform_4.3.2_1473617060_linux_gtk_x86_64
# I wish Eclipse was better scriptable...
echo "==> set workspace manually"
mkdir -p ~/.eclipse/$ECLIPSE_FOLDER_NAME
cp -r /opt/eclipse/configuration ~/.eclipse/$ECLIPSE_FOLDER_NAME
mkdir -p ~/.eclipse/$ECLIPSE_FOLDER_NAME/configuration/.settings
mv ~/org.eclipse.ui.ide.prefs ~/.eclipse/$ECLIPSE_FOLDER_NAME/configuration/.settings
chown -R rca ~/.eclipse

# We are installing the following plug-ins:
#   - Eclipse Java Development Tools
#   - PyDev for Eclipse
#   - Eclipse Xml Editors and Tools
#   - Eclipse Swing Designer
echo "==> install the required eclipse plug-ins"
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
