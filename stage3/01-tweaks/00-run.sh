#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 1
        cp -r files/os-release /usr/lib/os-release
	cp -r files/pi-greeter.conf /etc/lightdm/pi-greeter.conf
EOF
