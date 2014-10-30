#!/bin/bash

# enter your RCA account details here
export RCA_USER=
export RCA_PASSWORD=
export RCA_REPOSITORY_URL=


# this should not break if this is run without user account
if [[ -n "$RCA_USER" ]]; then
	# disable paging in gitslave which will break the checkout
	export PAGER=cat
	export GIT_PAGER=cat
	# we need to store the credentials for this
	git config --global credential.https://$RCA_REPOSITORY_URL.helper store

	cd
	mkdir ~/rcasoftware

	echo
	echo 'Cloning last seasons software repositories...'
	gits clone https://$RCA_USER:$RCA_PASSWORD@$RCA_REPOSITORY_URL/git/software.git -b season2013 ~/rcasoftware/s2013
	gits clone https://$RCA_REPOSITORY_URL/git/software.git -b season2014 ~/rcasoftware/s2014

	echo
	echo 'Cloning the current software repositories...'
	gits clone https://$RCA_REPOSITORY_URL/git/software.git -b develop ~/rcasoftware/s2015

	echo
	echo 'Setting up git-flow...'
	cd ~/rcasoftware/s2015/
	gits exec git branch --track master origin/master
	gits exec git flow init -d

	echo
	echo 'Copying eclipse configuration...'
	cd ~/rcasoftware/s2013/.rca/eclipse/
	cp -R . ~/rcasoftware/s2013/
	cd ~/rcasoftware/s2014/.rca/eclipse/
	cp -R . ~/rcasoftware/s2014/
	cd ~/rcasoftware/s2015/.rca/eclipse/
	cp -R . ~/rcasoftware/s2015/

	cd
	# symlink to desktop for easier access
	mkdir -p ~/Desktop
	ln -s ~/rcasoftware ~/Desktop
	# move the init script to the right place
	chmod a+x ~/init.sh
	mv ~/init.sh ~/rcasoftware
	chmod a+x ~/Initializer
	mv ~/Initializer ~/Desktop
	# move the season tabs around
	chmod a+x ~/Season2013
	chmod a+x ~/Season2014
	chmod a+x ~/Season2015
	mv ~/Season2013 ~/Desktop
	mv ~/Season2014 ~/Desktop
	mv ~/Season2015 ~/Desktop
	# move the init script to the right place
	mv ~/ReadMe.html ~/Desktop

	# and because we are stupid this happens
	find ~/rcasoftware/s2013/.git/ -type f -readable -writable -exec sed -i "s/$RCA_USER:$RCA_PASSWORD@$RCA_REPOSITORY_URL/$RCA_REPOSITORY_URL/g" {} \;
	# delete the credentials file
	rm ~/.git-credentials
else
	# remove both scripts
	rm ~/init.sh
	rm ~/ReadMe.html
	rm ~/Season2013
	rm ~/Season2014
	rm ~/Season2015
fi
