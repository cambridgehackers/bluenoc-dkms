#!/bin/sh

mkdir -p /usr/src/bluenoc-2015.09.beta1
cp -fv dkms.conf Makefile  bluenoc.c bluenoc.h /usr/src/bluenoc-2015.09.beta1
mkdir -p /etc/udev/rules.d
cp -fv 99-bluespec.rules /etc/udev/rules.d
#dkms uninstall bluenoc/2015.09.beta1
#dkms remove bluenoc/2015.09.beta1

dkms add bluenoc/2015.09.beta1
dkms install bluenoc/2015.09.beta1

