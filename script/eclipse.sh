echo "==> download and expand eclipse-installer (oomph)"
curl http://ftp.fau.de/eclipse/oomph/updates/latest/org.eclipse.oomph.site.zip -o oomph.zip
mkdir ~/eclipse
unzip oomph.zip -d ~/eclipse/eclipse-installer
rm oomph.zip

echo "==> installing eclipse launch files"
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /home/rca/eclipse/
chmod a+x /usr/bin/eclipse-nice.sh


