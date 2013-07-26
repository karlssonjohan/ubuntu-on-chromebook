#!/bin/bash

# Based on https://gist.github.com/vvuk/4986933

if [ -f /etc/os-release ]; then
	source /etc/uoc-config
	mp=""
else
	source /usr/local/etc/uoc-config
	mp=$MP
fi

echo "console=tty1 printk.time=1 nosplash rootwait root=${ROOTFS} rw rootfstype=ext4" > $mp/boot/cmd
vbutil_kernel --pack $mp/boot/chronos-kernel-image --keyblock $mp/usr/share/vboot/devkeys/kernel.keyblock \
	--signprivate $mp/usr/share/vboot/devkeys/kernel_data_key.vbprivk --config $mp/boot/cmd \
	--vmlinuz $mp/boot/vmlinuz-${KERNEL_VERSION}-chromebook --version 1 --arch arm

dd if=$mp/boot/chronos-kernel-image of=${KERN} bs=512

cgpt add -i 6 -P 12 -S 0 -T 1 ${DISK}
