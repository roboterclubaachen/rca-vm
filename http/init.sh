#!/bin/bash

if [[ ! $(git config --global --get user.name) || ! $(git config --global --get user.email) ]]
  then
    echo 'Welcome to the RCA initializer for software development.'
    echo
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
        cd ~/rcasoftware/s2014/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
        cd ~/rcasoftware/s2015/xpcc/
        git config user.name "$GIT_PSEUDONYM"
        git config user.email "$GIT_PSEUDONYM"
    fi
    echo
    echo 'Thanks, I have set up git for you.'
    echo
fi