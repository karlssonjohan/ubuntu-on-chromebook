#!/bin/sh

source /etc/uoc-config

chroot $MP bash -c "init-chroot-env.sh;uoc-install.sh"
chroot $MP bash -c "init-chroot-env.sh;setupkernel.sh"
