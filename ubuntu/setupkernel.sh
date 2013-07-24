#!/bin/sh

# This is from https://gist.github.com/vvuk/4986933

MP=/media/ubuntu
target_disk=/dev/mmcblk0
target_kern=/dev/mmcblk0p6
target_rootfs=/dev/mmcblk0p7

echo "console=tty1 printk.time=1 nosplash rootwait root=${target_rootfs} rw rootfstype=ext4" > $MP/boot/cmd
vbutil_kernel --pack $MP/boot/chronos-kernel-image --keyblock $MP/usr/share/vboot/devkeys/kernel.keyblock --signprivate $MP/usr/share/vboot/devkeys/kernel_data_key.vbprivk --config $MP/boot/cmd --vmlinuz $MP/boot/vmlinuz-3.4.0-5-chromebook --version 1 --arch arm
dd if=$MP/boot/chronos-kernel-image of=${target_kern} bs=512

cgpt add -S 0 -T 1 -P 12 -i 6 ${target_disk}
