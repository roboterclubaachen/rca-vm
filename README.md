RCA vagrant boxes
=================

Packer definitions for vagrant VirtualBox boxes used for xpcc and eurobot development.

The ``xpcc-vm.box`` is based on the Ubuntu 12.04 LTS Server distro.
It is used to compile and test xpcc without a GUI.

The ``eurobot-vm.box`` is based on the Ubuntu 12.04 LTS Alternate distro.
It incorporates all software in ``xpcc-vm.box``, but has a GUI with the Eclipse IDE and is used to develop our software for the Eurobot competition.


Getting Started
===============

A GNU Make makefile is provided to support automated builds.  It assumes
that both GNU Make and Packer are in the PATH.  Download and install
Packer from <http://www.packer.io/downloads.html>

To build the ``xpcc-vm.box``:

	cd descriptions
	packer build xpcc-vm.json
	cd ../

To build the ``eurobot-vm.box``:

	cd descriptions
	packer build eurobot-vm.json
	cd ../

Import the boxes into vagrant:

	vagrant box add xpcc xpcc-vm.box
	vagrant box add eurobot eurobot-vm.box

Then you can start the boxes at a suitable location:

	vagrant init xpcc
	vagrant up

Credit
======

These definitions were adapted from GitHub user [misheska](https://github.com/misheska/basebox-packer), unfortunately without a license.

