Ubuntu on chromebook
====================
Some stuff for my Samsung chromebook (SNOW PREMIER D-E 1700)

### Create an archive of this repo
git archive master | gzip > ubuntu-on-chromebook-master.tar.gz

### Destroy Chrome OS system
Run the below command to destroy your system. Wait a few minutes and then try to run some command, the system will reboot. When it comes back up again it will complain about Chrome OS being missing or damaged.

<code>sudo dd if=/dev/zero of=/dev/mmcblk0</code>

### Restore Chrome OS system
Create a Chrome OS image on a USB stick and insert it when you see the "Chrome OS is missing or damaged" screen. For more details see https://support.google.com/chromeos/answer/1080595?hl=en

### Set developer mode
Login and then press:

<code>esc-refresh-power</code>

It will reboot and say someting like "Chrome OS is missing or damaged", press:

<code>ctrl-d</code>

Then, when asked to do so, press

<code>Enter</code>

The system will reboot and prepare for Developer Mode. It will take a few minutes. When it's done it will reboot again.

Optionally you can press ctrl-d at the "OS verification is OFF" screen to make the boot a bit faster.

### Open a shell in chrome browser
Only works in developer mode.

<code>ctrl-alt-t</code>

<code>shell</code>

Sometimes it's not possible to open more than one shell. A workaround is to press ctrl-alt-t and open as many shells as you want before typing shell.

### Paste into the shell
<code>ctrl-shift-v</code>

### Install Ubuntu 13.04
This will create a new partition on your internal disk and install ubuntu.

Download script

<code>curl -L -O http://goo.gl/s9ryd</code>

Partition disk

<code>sudo bash s9ryd default latest</code>

The system will reboot after you selected the partion size. When it starts again it will say "Your system is repairing itself". After a few minutes it will reboot again. Login again and download the script again (if it was removed).

<code>curl -L -O http://goo.gl/s9ryd</code>

Change user name (optional)

<code>cat s9ryd | sed 's/ user/ johan/' | sed 's/user:user/johan:johan/' > tmp; mv tmp s9ryd</code>

Change hostname (optional)

<code>cat s9ryd | sed 's/chrubuntu/superhost/' > tmp; mv tmp s9ryd</code>

Install

<code>sudo bash s9ryd default latest</code>

tmp:
chroot
apt-get install ubuntu-desktop
apt-get install xserver-xorg-video-armsoc
apt-get install gnome
apt-get install vboot-utils
apt-get install cgpt
apt-get install linux-tools
apt-get intsall u-boot-tools

maybe replace these with apt-get install vboot-kernel-utils??
sudo cp /usr/bin/vbutil_* /media/ubuntu/usr/bin/
sudo cp /usr/bin/dump_kernel_config /media/ubuntu/usr/bin
sudo cp -R /usr/share/vboot /media/ubuntu/usr/share/vboot/
sudo cp -R /usr/bin/old_bins /media/ubuntu/usr/bin

cmd:
chmod a+w /tmp

apt-get install linux-headers-chromebook

### Fix Ubuntu console keyboard layout
Update file /etc/default/keyboard

Run commands
<code>dpkg-reconfigure keyboard-configuration</code>
<code>setupcon</code>

Might require reboot.

### Wireless from command line
echo "manual" > /etc/init/network-manager.override
