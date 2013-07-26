#!/bin/bash

source /etc/uoc-config

echo "Setting default OS to Chrome"
cgpt add -i 6 -P 0 -S 0 $DISK
