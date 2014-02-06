#!/bin/bash -eux

VAGRANT_USER=rca

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "Installing VirtualBox guest additions"

    apt-get install -y linux-headers-$(uname -r) build-essential perl
    apt-get install -y dkms

    VBOX_VERSION=$(cat /home/$VAGRANT_USER/.vbox_version)
    mount -o loop /home/$VAGRANT_USER/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
#    sh /mnt/VBoxLinuxAdditions.run --nox11
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm /home/$VAGRANT_USER/VBoxGuestAdditions_$VBOX_VERSION.iso
fi
