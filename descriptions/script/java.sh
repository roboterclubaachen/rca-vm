# add required repositories
sudo apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get -y update

# install oracles java7

# this silences the license question
echo debconf shared/accepted-oracle-license-v1-1 select true | \
sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
sudo debconf-set-selections

sudo apt-get install -y oracle-java7-installer librxtx-java
sudo ln -s /usr/lib/jvm/java-7-oracle/ /usr/lib/jvm/default-java
