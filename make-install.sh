#!/bin/bash

source uoc-config

# Chrome OS stuff
if [ ! -d /usr/local/etc ]; then
	mkdir /usr/local/etc
fi
cp uoc-config /usr/local/etc

cd chromeos
sudo bash ./make-install.sh

# Ubuntu stuff
cd ..
if [ -d $MP/etc ]; then
	cp uoc-config $MP/etc
	cd ubuntu
	sudo bash ./make-install.sh $MP
else
	echo "WARNING: Ubuntu partition not mounted."
fi
