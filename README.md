ubuntu-on-chromebook
====================

Some stuff for my Samsung chromebook (SNOW PREMIER D-E 1700)

### Destroy ChromeOS system
Run the below command to destroy your system. Wait a few minutes and then try to run some command, the system will reboot. When it comes back up again it will complain about Chrome OS being missing or damaged.

<code>sudo dd if=/dev/zero of=/dev/mmcblk0</code>

### Restore ChromeOS system

Create a ChromeOS image on a USB stick and insert it when you see the "Chrome OS is missing or damaged" screen. For more details see https://support.google.com/chromeos/answer/1080595?hl=en

### Set developer mode

### Open a shell in chrome browser
ctrl-alt-t

shell

### Install Ubuntu 13.10

