#!/bin/sh

BIN_DIR=/usr/local/bin

if [ ! -d $BIN_DIR ]; then
	mkdir $BIN_DIR
fi

cp -f * /usr/local/bin
