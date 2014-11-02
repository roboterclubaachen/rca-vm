
# add required repositories
apt-get install -y software-properties-common
add-apt-repository ppa:terry.guo/gcc-arm-embedded
apt-get -y update
# gcc version needs to specified
# see https://bugs.launchpad.net/gcc-arm-embedded/+bug/1309060
# update 18-10-14: supplying version may not be needed anymore
apt-get install -y gcc-arm-none-eabi

# install required packages
apt-get install -y python-dev scons python-jinja2 python-lxml graphviz git \
git-flow gitk build-essential libboost-thread-dev libboost-system-dev meld \
libasio-dev gcc-avr binutils-avr avr-libc pandoc avrdude curl gitg gcc texinfo \
markdown python-docutils libusb-dev dfu-programmer bash-completion \
libgtkmm-2.4-dev libreadline-dev libsdl1.2-dev libsdl-image1.2-dev git-core \
subversion libusb-1.0-0-dev python-pip libftdi-dev libtool ack-grep tree

apt-get build-dep -y dfu-util
apt-get --no-install-recommends install -y doxygen
pip install --user bitarray
# pip seems to screw up the file permissions
chown rca:rca -R .local

# The tipc kernel modul has to be enabled manually
sh -c 'echo "tipc" >> /etc/modules'

# install openocd from repository
apt-get install -y openocd

# build gitslave from source
sudo apt-get install -y libterm-progressbar-perl libparallel-iterator-perl
git clone git://gitslave.git.sourceforge.net/gitroot/gitslave/gitslave
cd gitslave/
sudo make install
cd
rm -rf ~/gitslave

# add our configurations to bashrc
echo "source ~/.rcarc" >> ~/.bashrc
