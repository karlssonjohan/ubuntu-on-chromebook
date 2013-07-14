#!/bin/bash

if [ ! -c /dev/pts/0 ]; then
	mount -t devpts devpts /dev/pts
fi

if [ ! -f /proc/cpuinfo ]; then
	mount -t proc proc /proc
fi

EDITOR=vi
export EDITOR
