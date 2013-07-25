#!/bin/bash

source /etc/uoc-config

if [ ! -d $MP ]; then
	mkdir $MP
fi

mount $ROOTFS $MP
