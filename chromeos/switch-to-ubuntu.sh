#!/bin/bash

source /usr/local/etc/uoc-config

echo "Setting default OS to Ubuntu"
cgpt add -i 6 -P 5 -S 1 $DISK
