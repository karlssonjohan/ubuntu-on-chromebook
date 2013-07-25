#!/bin/sh

# Based on https://gist.github.com/vvuk/4986933

TARGET_DISK=/dev/mmcblk0
TARGET_KERN=/dev/mmcblk0p6
TARGET_ROOTFS=/dev/mmcblk0p7

if [ `grep -i id=ubuntu /etc/os-release` ]; then
	mp=""
else
	mp=/media/ubuntu
fi

echo "console=tty1 printk.time=1 nosplash rootwait root=${TARGET_ROOTFS} rw rootfstype=ext4" > $mp/boot/cmd
vbutil_kernel --pack $mp/boot/chronos-kernel-image --keyblock $mp/usr/share/vboot/devkeys/kernel.keyblock \
	--signprivate $mp/usr/share/vboot/devkeys/kernel_data_key.vbprivk --config $mp/boot/cmd \
	--vmlinuz $mp/boot/vmlinuz-3.4.0-5-chromebook --version 1 --arch arm

dd if=$mp/boot/chronos-kernel-image of=${TARGET_KERN} bs=512

cgpt add -S 0 -T 1 -P 12 -i 6 ${TARGET_DISK}
