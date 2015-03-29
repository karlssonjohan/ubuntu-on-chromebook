Ubuntu 13.04 and 13.10 on chromebook
====================================
How to install Ubuntu on a Samsung chromebook (SNOW PREMIER D-E 1700)

## Info about chromebook
Some miscellaneous info about chromebook. You need to know this to be able to install Ubuntu or recover your chromebook.

#### Destroy Chrome OS system
If you need to start from scratch run the below command to destroy your system. Wait a few minutes and then try to run some command (or reboot), the system will reboot. When it comes back up again it will complain about Chrome OS being missing or damaged.

<code>sudo dd if=/dev/zero of=/dev/mmcblk0</code>

If you destroy your system from within Ubuntu you will see the "OS verification is OFF" screen after reboot. You need to enable "OS verification" again to get the "Chrome OS is missing or damaged" screen, see https://support.google.com/chromeos/answer/1080595?hl=en

#### Restore Chrome OS system
Create a Chrome OS image on a USB stick and insert it when you see the "Chrome OS is missing or damaged" screen. For more details see https://support.google.com/chromeos/answer/1080595?hl=en

#### Set developer mode
You will need to this to be able to open a shell. Login and then press:

<code>esc-refresh-power</code>

It will reboot and say someting like "Chrome OS is missing or damaged", press:

<code>ctrl-d</code>

Then, when asked to do so, press

<code>Enter</code>

The system will reboot and prepare for Developer Mode. It will take a few minutes. When it's done it will reboot again. Optionally you can press ctrl-d at the "OS verification is OFF" screen to make the boot a bit faster.

#### Open a shell in chrome browser
Only works in developer mode.

<code>ctrl-alt-t</code>

<code>shell</code>

Sometimes it's not possible to open more than one shell. A workaround is to press ctrl-alt-t and open as many shells as you want before typing shell.

#### Paste into the shell
<code>ctrl-shift-v</code>

## Install Ubuntu
This will create a new partition on your internal disk and install ubuntu. You need to set developer mode first, see above, and then open a shell in the chrome browser, see above.

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

## Upgrade to Ubuntu 13.10
It does not seem to be possible to install 13.10 but you can upgrade from 13.04 to 13.10. However, it seems like it is only possible to upgrade from a freshly installed 13.04 by following the instructions above and then upgrade to 13.10. Also Gnome will not work; you will have to install Xfce. After installing 13.04 do this.

#### Prepare for upgrade
<code>apt-get update</code>

<code>apt-get -y upgrade</code>

<code>apt-get -y dist-upgrade</code>

#### Updgrade
Use the Software updater to perform the upgrade to 13.10.

#### Install Xfce
Gnome will not work so use Xfce instead.

<code>add-apt-repository -y paa:xubuntu-dev/xfce-4.10</code>

<code>apt-get update</code>

<code>apt-get -y upgrade</code>

<code>apt-get -y install xfce4</code>


## Ubuntu tweaks
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

#### Enable HTML5 video on youtube in chrome
Go to chrome store and install
 - HTML5ify
 - HTML5 video for YouTube

#### Install SDHC card
To install a Samsung 64GB Class 10 U1 SDXC MB-SGCGB SDHC card.

<code>sudo apt-get install exfat-fuse</code>

Create a directory to mount it on.

<code>sudo mkdir /misc</code>

<code>sudo chmod 777 /misc</code>

Then add the line below to /etc/fstab

<code>/dev/mmcblk1p1	/misc	exfat	defaults	0	2</code>

#### Fonts and stuff

<code>sudo apt-get install ubuntu-restricted-extras</code>

#### Fix Ubuntu console keyboard layout
Update file /etc/default/keyboard

Run commands:

<code>dpkg-reconfigure keyboard-configuration</code>

<code>setupcon</code>

Might require reboot.

## References
http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook

http://www.chromium.org/chromium-os/poking-around-your-chrome-os-device

http://superuser.com/questions/433605/how-do-i-paste-into-the-crosh-terminal-in-a-chromebook

http://chromeos-cr48.blogspot.se/

https://gist.github.com/vvuk/4986933

https://www.anavi.org/article/150/

## Create an archive of this repo
<code>git archive master | gzip > ubuntu-on-chromebook.tar.gz</code>
