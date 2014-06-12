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
