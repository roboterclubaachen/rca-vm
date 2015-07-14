echo "==> download and expand eclipse-installer"
curl http://ftp.fau.de/eclipse/oomph/updates/latest/org.eclipse.oomph.site.zip -o oomph.zip
mkdir ~/eclipse
unzip oomph.zip -d ~/eclipse/eclipse-installer
rm oomph.zip

echo "==> installing eclipse to location"
mv eclipse /opt
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /home/rca/eclipse/
chmod a+x /usr/bin/eclipse-nice.sh


