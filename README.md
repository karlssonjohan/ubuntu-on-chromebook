Ubuntu on chromebook
====================
Some stuff for my Samsung chromebook (SNOW PREMIER D-E 1700)

### Destroy Chrome OS system
Run the below command to destroy your system. Wait a few minutes and then try to run some command, the system will reboot. When it comes back up again it will complain about Chrome OS being missing or damaged.

<code>sudo dd if=/dev/zero of=/dev/mmcblk0</code>

### Restore Chrome OS system
Create a Chrome OS image on a USB stick and insert it when you see the "Chrome OS is missing or damaged" screen. For more details see https://support.google.com/chromeos/answer/1080595?hl=en

### Set developer mode
At the login screen, press:

esc-refresh-power

It will reboot and say someting like "Chrome OS is missing or damaged", press:

ctrl-d

Then press

Enter

The system will reboot and prepare for Developer Mode. It will take a few minutes. When it's done it will reboot again.

### Open a shell in chrome browser
ctrl-alt-t

shell

### Paste into the shell
ctrl-shift-v

### Install Ubuntu 12.04
This will create a new partition on your internal disk and install ubuntu. 

Download script

<code>curl -L -O http://goo.gl/s9ryd</code>

Partition disk

<code>sudo bash s9ryd default lts</code>

The system will reboot after you selected the partion size. When it starts again it will say "Your system is repairing itself". After a few minutes it will reboot again. Login again and download the script again (if it was removed).

<code>curl -L -O http://goo.gl/s9ryd</code>

Change user name (optional)

<code>cat s9ryd | sed 's/ user/ johan/' | sed 's/user:user/johan:johan/' > tmp; mv tmp s9ryd</code>

Install

<code>sudo bash s9ryd default lts</code>

tmp:
chroot
apt-get install lightdm
apt-get install ubuntu-desktop
