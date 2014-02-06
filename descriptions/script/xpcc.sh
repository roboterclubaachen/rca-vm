VAGRANT_USER=rca

# add required repositories
sudo apt-get install -y python-software-properties
add-apt-repository ppa:terry.guo/gcc-arm-embedded
apt-get -y update

# install packages

apt-get install -y python-dev scons python-jinja2 python-lxml graphviz git \
git-flow gitk build-essential libboost-thread-dev libboost-system-dev meld \
libasio-dev gcc-avr binutils-avr avr-libc pandoc avrdude curl gitg gcc texinfo \
markdown python-docutils libusb-dev dfu-programmer bash-completion picocom \
libgtkmm-2.4-dev libreadline-dev libsdl1.2-dev libsdl-image1.2-dev git-core \
subversion libusb-1.0-0-dev python-pip gcc-arm-none-eabi libftdi-dev libtool

apt-get build-dep -y dfu-util
apt-get --no-install-recommends install -y doxygen
pip install --user bitarray

# The tipc kernel modul has to be enabled and the user requires access to the serial ports

sh -c 'echo "tipc" >> /etc/modules'
sudo usermod -a -G dialout $VAGRANT_USER
sudo usermod -a -G vboxsf $VAGRANT_USER

# install openocd from source

cd
git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd/
git checkout v0.7.0
./bootstrap
./configure --enable-maintainer-mode --enable-ft2232_libftdi  --enable-stlink \
--enable-buspirate --prefix=/opt/openocd --disable-option-checking
make
make install
cd
echo "export PATH=\$PATH:/opt/openocd/bin/" >> ~/.bashrc
rm -rf ~/openocd
