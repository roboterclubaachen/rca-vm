cp http/40-openocd.rules ~/
cp http/busblaster-ktlink.cfg ~/
if [ ! -f ~/.eaglerc ]; then
	cp http/eaglerc ~/.eaglerc
fi
cp http/eclipse.desktop ~/
cp http/eclipse.gtkrc ~/
cp http/eclipse-nice.sh ~/

sudo ./scripts/xpcc.sh
sudo ./scripts/xpcc_files.sh
sudo ./scripts/java.sh
sudo ./scripts/eclipse.sh
sudo ./scripts/eagle.sh