#!/bin/sh

source /usr/local/etc/uoc-config

mkdir $MP/etc/X11/xorg.conf.d
cp ubuntu/x.conf $MP/etc/X11/xorg.conf.d
chroot $MP bash -c "init-chroot-env.sh;uoc-install.sh"
chroot $MP bash -c "init-chroot-env.sh;setupkernel.sh"
