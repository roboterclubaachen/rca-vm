#!/bin/bash

export RCA_USER=censored
export RCA_PASSWORD=censored
export RCA_REPOSITORY_PATH=censored
export PAGER=cat
export GIT_PAGER=cat
git config --global credential.https://$RCA_REPOSITORY_PATH.helper store

cd
mkdir ~/rcasoftware

echo
echo 'Cloning last seasons software repositories...'
gits clone https://$RCA_USER:$RCA_PASSWORD@$RCA_REPOSITORY_PATH/git/software.git -b season2014 ~/rcasoftware/s2014

echo
echo 'Cloning the current software repositories...'
gits clone https://$RCA_REPOSITORY_PATH/git/software.git -b develop ~/rcasoftware/s2015

echo
echo 'Setting up git-flow...'
cd ~/rcasoftware/s2015/
gits exec git branch --track master origin/master
gits exec git flow init -d

echo
echo 'Copying eclipse configuration...'
cd ~/rcasoftware/s2014/config/eclipse/
cp -iRv . ~/rcasoftware/s2014/
cd ~/rcasoftware/s2015/config/eclipse/
cp -iRv . ~/rcasoftware/s2015/

rm ~/.git-credentials
# symlink to desktop for easier access
ln -s ~/rcasoftware ~/Desktop/
