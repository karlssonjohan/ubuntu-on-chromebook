#!/bin/bash

# Chrome OS stuff
source uoc-config
cp uoc-config /usr/local/etc
cd chromeos
./make-install.sh

# Ubuntu stuff
cd ..
if [ -d $MP/etc ]; then
	cp uoc-config $MP/etc
	cd ubuntu
	./make-install.sh $MP
else
	echo "WARNING: Ubuntu partition not mounted."
fi
