#!/bin/bash

source /etc/uoc-config

bin_dir=$1/usr/local/bin
if [ ! -d $bin_dir ]; then
	mkdir $bin_dir
fi

cp -f *sh $bin_dir
