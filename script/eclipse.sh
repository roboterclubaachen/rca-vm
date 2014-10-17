VAGRANT_USER=rca

echo "==> download and expand eclipse"
curl http://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/luna/SR1/eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz \
    -o eclipse.tar.gz
tar -xvzf eclipse.tar.gz
rm eclipse.tar.gz

echo "==> installing eclipse to location"
mv eclipse /opt
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /opt/eclipse
chmod a+x /usr/bin/eclipse-nice.sh

# We are installing the following plug-ins:
#   - Eclipse Java Development Tools
#   - PyDev for Eclipse
#   - Eclipse Xml Editors and Tools
#   - Eclipse Swing Designer
echo "==> install the required eclipse plug-ins"
/opt/eclipse/eclipse \
-application org.eclipse.equinox.p2.director \
-noSplash \
-destination /opt/eclipse \
-repository \
http://download.eclipse.org/releases/kepler,\
http://pydev.org/updates \
-installIUs org.eclipse.jdt.feature.group,\
org.python.pydev.feature.feature.group,\
org.eclipse.wst.xml_ui.feature.feature.group,\
org.eclipse.wb.swing.feature.feature.group \
-tag rca-plugin-v1.0
