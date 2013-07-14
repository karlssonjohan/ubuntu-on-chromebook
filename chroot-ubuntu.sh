#!/bin/bash

source config

chroot $MP
mount -t devpts devpts /dev/pts
mount -t proc proc /proc
