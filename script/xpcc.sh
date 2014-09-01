
# add required repositories
sudo apt-get install -y software-properties-common
add-apt-repository ppa:terry.guo/gcc-arm-embedded
apt-get -y update
# gcc version needs to specified
# see https://bugs.launchpad.net/gcc-arm-embedded/+bug/1309060
apt-get install gcc-arm-none-eabi=4-8-2014q2-0trusty10

# install required packages
apt-get install -y python-dev scons python-jinja2 python-lxml graphviz git \
git-flow gitk build-essential libboost-thread-dev libboost-system-dev meld \
libasio-dev gcc-avr binutils-avr avr-libc pandoc avrdude curl gitg gcc texinfo \
markdown python-docutils libusb-dev dfu-programmer bash-completion picocom \
libgtkmm-2.4-dev libreadline-dev libsdl1.2-dev libsdl-image1.2-dev git-core \
subversion libusb-1.0-0-dev python-pip libftdi-dev libtool

apt-get build-dep -y dfu-util
apt-get --no-install-recommends install -y doxygen
pip install --user bitarray

# The tipc kernel modul has to be enabled manually
sh -c 'echo "tipc" >> /etc/modules'

# install openocd from source
cd
git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd/
git checkout v0.8.0
./bootstrap
./configure --enable-maintainer-mode --enable-ft2232_libftdi  --enable-stlink \
--enable-buspirate --prefix=/opt/openocd --disable-option-checking
make
make install
cd
echo "export PATH=\$PATH:/opt/openocd/bin/" >> ~/.bashrc
rm -rf ~/openocd

# build gitslave from source
sudo apt-get install -y libterm-progressbar-perl libparallel-iterator-perl
git clone git://gitslave.git.sourceforge.net/gitroot/gitslave/gitslave
cd gitslave/
sudo make install
cd
rm -rf ~/gitslave
