#!/bin/sh

BIN_DIR=/usr/local/bin
ETC_DIR=/usr/local/etc
DIRS="$BIN_DIR $ETC_DIR"

for dir in DIRS 
do
	if [ ! -d $dir ]; then
		mkdir $dir
	fi
done

cp -f * $BIN_DIR
