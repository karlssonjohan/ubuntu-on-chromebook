Ubuntu 13.04 on chromebook
==========================
Some stuff for my Samsung chromebook (SNOW PREMIER D-E 1700)

### Create an archive of this repo
<code>git archive master | gzip > ubuntu-on-chromebook.tar.gz</code>

### Destroy Chrome OS system
Run the below command to destroy your system. Wait a few minutes and then try to run some command (or reboot), the system will reboot. When it comes back up again it will complain about Chrome OS being missing or damaged.

<code>sudo dd if=/dev/zero of=/dev/mmcblk0</code>

If you destroy your system from within Ubuntu you will see the "OS verification is OFF" screen after reboot. You need to enable "OS verification" again to get the "Chrome OS is missing or damaged" screen.

### Restore Chrome OS system
Create a Chrome OS image on a USB stick and insert it when you see the "Chrome OS is missing or damaged" screen. For more details see https://support.google.com/chromeos/answer/1080595?hl=en

### Set developer mode
Login and then press:

<code>esc-refresh-power</code>

It will reboot and say someting like "Chrome OS is missing or damaged", press:

<code>ctrl-d</code>

Then, when asked to do so, press

<code>Enter</code>

The system will reboot and prepare for Developer Mode. It will take a few minutes. When it's done it will reboot again. Optionally you can press ctrl-d at the "OS verification is OFF" screen to make the boot a bit faster.

### Open a shell in chrome browser
Only works in developer mode.

<code>ctrl-alt-t</code>

<code>shell</code>

Sometimes it's not possible to open more than one shell. A workaround is to press ctrl-alt-t and open as many shells as you want before typing shell.

### Paste into the shell
<code>ctrl-shift-v</code>

### Install Ubuntu
This will create a new partition on your internal disk and install ubuntu.

#### Partition disk

Download script

<code>curl -L -O http://goo.gl/s9ryd</code>

Partition disk

<code>sudo bash s9ryd default latest</code>

The system will reboot after you selected the partion size. When it starts again it will say "Your system is repairing itself". After a few minutes it will reboot again. 

#### Install

You can run the next part as many times as needed. Login again and download the script again (if it was removed).

<code>curl -L -O http://goo.gl/s9ryd</code>

Change user name (optional)

<code>cat s9ryd | sed 's/ user/ johan/' | sed 's/user:user/johan:johan/' > tmp; mv tmp s9ryd</code>

Change hostname (optional)

<code>sed -i 's/chrubuntu/superhost/g' s9ryd</code>

Disable reboot

<code>sed -i 's/^reboot/echo \"Run post-install.sh\"/g' s9ryd</code>

Install

<code>sudo bash s9ryd ubuntu-standard 13.04</code>

If you don't need a desktop you can stop here.

#### Desktop install

This will install ubuntu desktop, gnome and some other stuff to make the desktop work.

<code>wget https://github.com/karlssonjohan/ubuntu-on-chromebook/raw/master/ubuntu-on-chromebook.tar.gz</code>

Untar

<code>tar xvf ubuntu-on-chromebook.tar.gz</code>

Make install

<code>sudo bash make-install.sh</code>

Post install, this will take quite a while. About half way through you will need to manually select lightdm as display manager.

<code>sudo bash post-install.sh</code>

#### Done installing

When done, reboot to start Ubuntu

<code>sudo reboot</code>

At the login screen select Gnome as desktop.

At next reboot Chrome OS will start. If you want to switch back to Ubuntu, run:

<code>sudo switch-to-ubuntu.sh</code>

And then reboot.

### Ubuntu tweaks
Some tweaks and fixes.

#### Remove Gnash
Gnash is the GNU Flash movie player. Sometimes it consumes a lot of CPU and it does not seem to work anyway, at least not with chrome.

<code>sudo apt-get remove gnash gnash-common</code>
<code>sudo apt-get autoremove</code>

#### Enable sound
Remove/re-install some packages

<code>sudo apt-get remove --purge pulseaudio alsa-base</code>
<code>sudo apt-get install alsa-base</code>
<code>sudo apt-get autoremove</code>

Add sound module

<code>echo snd-soc-daisy-max98095 >>/etc/modules</code>

Fix alsa settings. 

<code>alsamixer</code>

Enable these using the "m" key.
 - Left speaker mixer left DAC1'
 - Right speaker mixer right DAC1'


### Fix Ubuntu console keyboard layout
Update file /etc/default/keyboard

Run commands:

<code>dpkg-reconfigure keyboard-configuration</code>

<code>setupcon</code>

Might require reboot.

### References
http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook

http://www.chromium.org/chromium-os/poking-around-your-chrome-os-device

http://superuser.com/questions/433605/how-do-i-paste-into-the-crosh-terminal-in-a-chromebook

http://chromeos-cr48.blogspot.se/

https://gist.github.com/vvuk/4986933

https://www.anavi.org/article/150/


