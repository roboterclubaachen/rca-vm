RCA Virtual Machines
====================

Packer definitions for VirtualBox virtual machines based on Ubuntu 14.04 LTS server used for *xpcc* and *EUROBOT* development.

The `xpcc-vm.box` is a headless VM, which provides all required tools for the development of our [xpcc microcontroller framework](xpcc.io).

The `eurobot-vm.box` incorporates all software in `xpcc-vm.box`, but has the Xubuntu Desktop with the Eclipse IDE and is used to develop our software for the EUROBOT competition.  
(We have to use the Xfce desktop, since Unity is too slow in a VM for practical use.)

A few final configuration steps for `eurobot-vm.box` can be omitted:

1. We ship this VM with all our internal software repositories already on disk (done by script/repositories.sh).
You need to declare the username, password and url of our git server to do this step, otherwise it is ignored.
2. We import eclipse preferences and project sets manually and then repackage the VM.


Getting Started
===============

You need [Packer](http://www.packer.io/docs/installation.html), [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html) installed on your system.

If you are running OS X, you can install Packer using [Homebrew](http://brew.sh) and Vagrant and VirtualBox using [Homebrew Cask](http://caskroom.io):

	brew tap homebrew/binary
	brew install packer
	
	brew install caskroom/cask/brew-cask
	brew install vagrant virtualbox

To build the ``xpcc-vm.box``:

	cd rca-vm/
	packer build xpcc-vm.json

To build the ``eurobot-vm.box``:

	cd rca-vm/
	packer build eurobot-vm.json

You can import the boxes into VirtualBox manually, however, using Vagrant as a management tool is ***strongly*** recommended!

After building, import the boxes into Vagrant:

	cd rca-vm/
	vagrant box add xpcc box/xpcc-vm.box
	vagrant box add eurobot box/eurobot-vm.box

Then you can start the xpcc-vm from any suitable location:

	mkdir xpcc-vm
	cd xpcc-vm
	vagrant init xpcc
	vagrant up
	vagrant ssh

To use the eurobot-vm, do the same in a different location:

	mkdir eurobot-vm
	cd eurobot-vm
	vagrant init eurobot
	vagrant up
	# no need for `vagrant ssh`, the GUI will pop up.

Consult the documentation on [Vagrant's CLI](http://docs.vagrantup.com/v2/cli/index.html) for proficient use of the tool.

We plan to host both VMs as prepacked boxes managed by Vagrant in the future.
