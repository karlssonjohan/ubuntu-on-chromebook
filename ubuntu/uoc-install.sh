#!/bin/bash

# Based on https://gist.github.com/vvuk/4986933

add-apt-repository -y ppa:chromebook-arm/ppa
apt-get update
apt-get -y upgrade
apt-get -y install ubuntu-desktop
apt-get -y install gnome
apt-get -y --force-yes remove flash-kernel linux-ac100
apt-get -y --force-yes install cgpt
apt-get -y --force-yes install chromebook-s3-default-settings
apt-get -y --force-yes install vboot-utils
apt-get -y --force-yes install vboot-kernel-utils
apt-get -y --force-yes install linux-tools
apt-get -y --force-yes install u-boot-tools
apt-get -y --force-yes install --no-install-recommends linux-image-chromebook
apt-get -y --force-yes install xserver-xorg-video-armsoc
