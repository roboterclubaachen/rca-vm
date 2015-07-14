#!/bin/bash

echo 'Welcome to the RCA initializer for software development.'
echo

if [[ ! $(git config --global --get user.name) || ! $(git config --global --get user.email) ]]
  then
    echo 'We want your commits to be signed with your name and email.'
    echo 'They will only be stored locally in your ~/.gitconfig file and'
    echo 'only used to sign your changes, when you commit something.'
    echo
    echo 'Please state your full name:'
    read GIT_NAME
    echo 'Please state your RWTH email:'
    read GIT_EMAIL
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    echo
    echo 'For our open-source project xpcc you may choose to use a pseudonym,'
    echo 'if you are uncomfortable with attaching your name to your commits.'
    echo '(You may leave this blank to use your full name and email.)'
    read GIT_PSEUDONYM
    if [[ -n $GIT_PSEUDONYM ]]
      then
        cd ~/rcasoftware/s2013/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
        cd ~/rcasoftware/s2014/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
        cd ~/rcasoftware/s2015/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
        cd ~/rcasoftware/s2016/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
    fi
    echo
    echo 'Thanks, I have set up git for you.'
    echo

    # disable paging for now
    export PAGER=cat
    export GIT_PAGER=cat
    echo 'I will now update all required software repositories.'
    echo 'Enter your RCA username and password when prompted.'

    cd ~/rcasoftware/s2013/
    gits populate
    gits fetch --all
    gits reset --hard origin/season2013
    cd ~/rcasoftware/s2014/
    gits populate
    gits fetch --all
    gits reset --hard origin/season2014
    cd ~/rcasoftware/s2015/
    gits populate
    gits fetch --all
    gits reset --hard origin/season2015
    cd ~/rcasoftware/s2016/
    gits populate
    gits fetch --all
    gits reset --hard origin/develop
    echo

    # update subversion
    cd
    cd ~/rcasoftware/roboter/
    svn update

    echo
    echo 'Done. You may now open Eclipse or EAGLE (on the right hand side) to start developing.'
    echo
else
    echo 'I cowardly refuse to run this script again.'
fi
