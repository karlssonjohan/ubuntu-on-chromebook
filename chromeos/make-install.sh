#!/bin/bash

BIN_DIR=/usr/local/bin
DIRS="$BIN_DIR"

for dir in $DIRS 
do
	if [ ! -d $dir ]; then
		mkdir $dir
	fi
done

cp -f * $BIN_DIR
