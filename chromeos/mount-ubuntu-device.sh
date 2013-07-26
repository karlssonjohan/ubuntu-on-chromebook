#!/bin/bash

source /usr/local/etc/uoc-config

if [ ! -d $MP ]; then
	mkdir $MP
fi

mount $ROOTFS $MP
