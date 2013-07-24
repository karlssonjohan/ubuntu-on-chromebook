#!/bin/sh

# This is from https://gist.github.com/vvuk/4986933

add-apt-repository -y ppa:chromebook-arm/ppa
apt-get update
apt-get -y --force-yes remove flash-kernel linux-ac100
apt-get -y --force-yes install cgpt chromebook-s3-default-settings vboot-utils
apt-get -y --force-yes install linux-tools-3.4.0-5
apt-get -y --force-yes install --no-install-recommends linux-image-chromebook
apt-get -y --force-yes install xserver-xorg-video-armsoc
