# move these files to the right location

mkdir -p /usr/share/openocd/scripts/interface
mv ~/busblaster-ktlink.cfg /usr/share/openocd/scripts/interface/busblaster-ktlink.cfg
mv ~/40-openocd.rules /etc/udev/rules.d/40-openocd.rules
rm ~/40-openocd.rules ~/busblaster-ktlink.cfg

