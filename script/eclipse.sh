echo "==> download and expand eclipse-installer (oomph)"
mkdir ~/eclipse
cd ~/eclipse
curl http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/oomph/products/eclipse-inst-linux64.tar.gz | tar xz
chown -R rca ~/eclipse

echo "==> installing eclipse launch files"
mv ~/eclipse.desktop /usr/share/applications
mv ~/eclipse-nice.sh /usr/bin
mv ~/eclipse.gtkrc /home/rca/eclipse/
chmod a+x /usr/bin/eclipse-nice.sh


