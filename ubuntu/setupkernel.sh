#!/bin/sh

# Based on https://gist.github.com/vvuk/4986933

DISK=/dev/mmcblk0
KERN=/dev/mmcblk0p6
ROOTFS=/dev/mmcblk0p7
KERNEL_VERSION=3.4.0.5

source /etc/uoc-config

if [ `grep -i id=ubuntu /etc/os-release` ]; then
	mp=""
else
	mp=$MP
fi

echo "console=tty1 printk.time=1 nosplash rootwait root=${ROOTFS} rw rootfstype=ext4" > $mp/boot/cmd
vbutil_kernel --pack $mp/boot/chronos-kernel-image --keyblock $mp/usr/share/vboot/devkeys/kernel.keyblock \
	--signprivate $mp/usr/share/vboot/devkeys/kernel_data_key.vbprivk --config $mp/boot/cmd \
	--vmlinuz $mp/boot/vmlinuz-${KERNEL_VERSION}-chromebook --version 1 --arch arm

dd if=$mp/boot/chronos-kernel-image of=${KERN} bs=512

cgpt add -i 6 -P 12 -S 0 -T 1 ${DISK}
