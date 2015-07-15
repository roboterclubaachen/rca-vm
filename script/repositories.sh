#!/bin/bash

# enter your RCA account details here
export RCA_USER=
export RCA_PASSWORD=
export RCA_SERVER=


# this should not break if this is run without user account
if [[ -n "$RCA_USER" ]]; then
	# disable paging in gitslave which will break the checkout
	export PAGER=cat
	export GIT_PAGER=cat
	# we need to store the credentials for this
	git config --global credential.https://$RCA_SERVER.helper store

	cd
	mkdir ~/rcasoftware

	echo
	echo 'Cloning last seasons software repositories...'
	gits clone https://$RCA_USER:$RCA_PASSWORD@$RCA_SERVER/git/software.git -b season2013 ~/rcasoftware/s2013
	gits clone https://$RCA_SERVER/git/software.git -b season2014 ~/rcasoftware/s2014
	gits clone https://$RCA_SERVER/git/software.git -b season2015 ~/rcasoftware/s2015

	echo
	echo 'Cloning the current software repositories...'
	gits clone https://$RCA_SERVER/git/software.git -b develop ~/rcasoftware/s2016

	echo
	echo 'Setting up git-flow...'
	cd ~/rcasoftware/s2016/
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
	cd ~/rcasoftware/s2016/.rca/eclipse/
	cp -R . ~/rcasoftware/s2016/

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
	chmod a+x ~/Season2016
	mv ~/Season2013 ~/Desktop
	mv ~/Season2014 ~/Desktop
	mv ~/Season2015 ~/Desktop
	mv ~/Season2016 ~/Desktop
	# move the init script to the right place
	mv ~/ReadMe.html ~/Desktop

	# and because we are stupid this happens
	find ~/rcasoftware/s2013/.git/ -type f -readable -writable \
		-exec sed -i "s/$RCA_USER:$RCA_PASSWORD@$RCA_SERVER/$RCA_SERVER/g" {} \;
	# delete the credentials file
	rm ~/.git-credentials

	# create .subversion
	svn --version
	# tell it to cache the authentication credentials
	echo "store-passwords = yes" >> ~/.subversion/servers
	echo "store-plaintext-passwords = yes" >> ~/.subversion/servers

	# download the et folders from subversion
	svn checkout https://$RCA_SERVER/svn/rca/trunk/roboter ~/rcasoftware/roboter/ \
		--username $RCA_USER --password $RCA_PASSWORD --depth=immediates --non-interactive
	cd ~/rcasoftware/roboter/

	# we only want the `et` folders of all robots
	# allgemein
	svn update allgemein --set-depth immediates
	svn update allgemein/et --set-depth infinity

	# season 2013
	svn update 2013_common --set-depth immediates
	svn update 2013_common/et --set-depth infinity
	svn update 2013_Kleinerbot --set-depth immediates
	svn update 2013_Kleinerbot/et --set-depth infinity
	svn update 2013_Grosserbot --set-depth immediates
	svn update 2013_Grosserbot/et --set-depth infinity

	# season 2014
	svn update 2014_common --set-depth immediates
	svn update 2014_common/et --set-depth infinity
	svn update 2014_Kleinerbot --set-depth immediates
	svn update 2014_Kleinerbot/et --set-depth infinity
	svn update 2014_grosserbot --set-depth immediates
	svn update 2014_grosserbot/et --set-depth infinity

	# season 2015
	svn update 2015_common --set-depth immediates
	svn update 2015_common/et --set-depth infinity
	svn update 2015_Phobos --set-depth immediates
	svn update 2015_Phobos/et --set-depth infinity
	svn update 2015_hal --set-depth immediates
	svn update 2015_hal/et --set-depth infinity

	# season 2016
	svn update 2016_common --set-depth immediates
	svn update 2016_common/et --set-depth infinity
	svn update 2016_big --set-depth immediates
	svn update 2016_big/et --set-depth infinity
	svn update 2016_little --set-depth immediates
	svn update 2016_little/et --set-depth infinity

	# remove all authentication credentials
	rm -rf ~/.subversion/auth

else
	# remove both scripts
	rm ~/init.sh
	rm ~/ReadMe.html
	rm ~/Season2013
	rm ~/Season2014
	rm ~/Season2015
	rm ~/Season2016
fi
