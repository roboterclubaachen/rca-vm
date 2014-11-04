#!/bin/bash

# enter your RCA account details here
export RCA_USER=
export RCA_PASSWORD=
export RCA_SERVER=

# install eagle
apt-get install -y eagle

# make home directory
mkdir ~/eagle

if [[ -n "$RCA_USER" ]]; then
	# download the license key
	curl https://$RCA_USER:$RCA_PASSWORD@$RCA_SERVER/ftp/software/eagle/6.x/license.key -o ~/eagle.key
else
	# remove our custom eagle rc
	rm ~/.eaglerc
fi
