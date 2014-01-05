#!/bin/bash

source /usr/local/etc/uoc-config

echo "Setting default OS to Ubuntu for next reboot only"
cgpt add -i 6 -P 5 -T 1 $DISK
