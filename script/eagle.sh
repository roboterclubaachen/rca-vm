#!/bin/bash

# enter your RCA account details here
export RCA_USER=
export RCA_PASSWORD=
export RCA_SERVER=

if [[ -n "$RCA_USER" ]]; then
	# we use the older 6.x version
	export EAGLE_URL=https://$RCA_USER:$RCA_PASSWORD@$RCA_SERVER/ftp/software/eagle/6.x/eagle-lin-6.5.0.run
	export EAGLE_NAME=eagle-6.5.0
else
	export EAGLE_URL=http://web.cadsoft.de/ftp/eagle/program/7.1/eagle-lin-7.1.0.run
	export EAGLE_NAME=eagle-7.1.0
fi

# install the 32bit libraries that eagle uses
apt-get install -y libxrender1:i386 libxrandr2:i386 libxcursor1:i386 libfreetype6:i386 \
libfontconfig1:i386 libxi6:i386 libxcursor1:i386 libfreetype6:i386 libfontconfig1:i386 \
libxi6:i386 libssl1.0.0:i386 libstdc++6:i386

# download eagle
curl $EAGLE_URL -o ~/eagle.run
chmod a+x eagle.run
# install it in /opt
~/eagle.run /opt
rm ~/eagle.run
ln -s /opt/$EAGLE_NAME /opt/eagle

# application link
mv ~/eagle.desktop /usr/share/applications


