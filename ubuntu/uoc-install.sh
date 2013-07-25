#!/bin/sh

source /etc/config

BIN_DIR=$MP//usr/local/bin

if [ ! -d $BIN_DIR ]; then
	mkdir $BIN_DIR
fi

cp -f * $BIN_DIR
