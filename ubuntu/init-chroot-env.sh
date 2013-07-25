#!/bin/bash

if [ ! -f /proc/cpuinfo ]; then
	mount -t proc proc /proc
fi

if [ ! -f /dev ]; then
	mount -o bind /dev /dev
fi

if [ ! -c /dev/pts/0 ]; then
	mount -t devpts devpts /dev/pts
fi

#if [ ! -f /sys ]; then
#	mount -t sysfs sys /sys
#fi

EDITOR=vi
export EDITOR
