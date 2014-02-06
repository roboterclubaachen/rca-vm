# add required repositories
sudo apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get -y update

# install oracles java7

sudo apt-get install oracle-java7-installer librxtx-java
sudo ln -s /usr/lib/jvm/java-7-oracle/ /usr/lib/jvm/default-java

# install gitslave

sudo apt-get install libterm-progressbar-perl libparallel-iterator-perl
git clone git://gitslave.git.sourceforge.net/gitroot/gitslave/gitslave
cd gitslave/
sudo make install
cd
rm -rf ~/gitslave
