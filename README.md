RCA vagrant boxes
=================

Packer definitions for vagrant VirtualBox boxes used for xpcc and eurobot development.

The ``xpcc-vm.box`` is based on the Ubuntu 12.04 LTS Server distro.
It is used to compile and test xpcc without a GUI.

The ``eurobot-vm.box`` is based on the Ubuntu 12.04 LTS Alternate distro.
It incorporates all software in ``xpcc-vm.box``, but has a GUI with the Eclipse IDE and is used to develop our software for the Eurobot competition.


Getting Started
===============

You need [Packer](http://www.packer.io/docs/installation.html), [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and optionally [Vagrant](http://www.vagrantup.com/downloads.html) installed on your system.

If you are running OS X, you can install Packer using [Homebrew](http://brew.sh):

	$ brew tap homebrew/binary
	$ brew install packer

To build the ``xpcc-vm.box``:

	cd rca-vm/descriptions
	packer build xpcc-vm.json
	cd ../

To build the ``eurobot-vm.box``:

	cd rca-vm/descriptions
	packer build eurobot-vm.json
	cd ../

You can import the boxes manually into VirtualBox, however VM management with vagrant is *strongly* recommended.

Import the boxes into vagrant:

	cd rca-vm
	vagrant box add xpcc xpcc-vm.box
	vagrant box add eurobot eurobot-vm.box

Then you can start the xpcc-vm from any suitable location:

	vagrant init xpcc
	vagrant up
	vagrant ssh

To use the eurobot-vm, do the same in a different location:

	vagrant init eurobot
	vagrant up
	# no need for vagrant ssh, the GUI will pop up.

Credit
======

These definitions were adapted from GitHub user [misheska](https://github.com/misheska/basebox-packer), unfortunately without a license.

