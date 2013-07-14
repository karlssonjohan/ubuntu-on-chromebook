#!/bin/bash

source config

if [ ! -d $MP ]; then
	mkdir $MP
fi

mount $UBUNTU_DEV $MP
