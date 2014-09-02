#!/bin/bash -eux

VAGRANT_USER=rca

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox guest additions"
    apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
fi
