# use ftp.halifax.rwth-aachen.de as source
sed -i 's/us.archive.ubuntu.com/ftp.halifax.rwth-aachen.de/' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/ftp.halifax.rwth-aachen.de/' /etc/apt/sources.list

apt-get -y update
apt-get -y upgrade
apt-get -y install curl
# Ensure NFS mounts work properly
apt-get -y install nfs-common
apt-get clean

VAGRANT_USER=rca
usermod -aG dialout $VAGRANT_USER
groupadd vboxsf
usermod -aG vboxsf $VAGRANT_USER
