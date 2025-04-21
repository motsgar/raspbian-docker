#!/usr/bin/env bash

set -e

sudo debootstrap --arch=arm64 --variant=minbase bookworm ./rootfs http://deb.debian.org/debian

echo "deb http://archive.raspberrypi.com/debian/ bookworm main" | sudo tee ./rootfs/etc/apt/sources.list.d/raspi.list
curl -fsSL https://archive.raspberrypi.com/debian/raspberrypi.gpg.key | sudo gpg --dearmor -o ./rootfs/etc/apt/trusted.gpg.d/raspberrypi-archive-keyring.gpg

sudo tar --numeric-owner -czf rootfs.tar.gz -C ./rootfs .

docker build --platform linux/aarch -t raspbian:bookworm .
