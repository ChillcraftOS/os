#!/bin/bash -e

ls
ls ../

install -m 644 ../files/os-release "${ROOTFS_DIR}/usr/lib/os-release"
install -m 644 ../files/pi-greeter.conf "${ROOTFS_DIR}/etc/lightdm/pi-greeter.conf"
install -m 644 ../files/asplashscreen "${ROOTFS_DIR}/etc/init.d/asplashscreen"
install -m 644 ../files/device-noises.rule "${ROOTFS_DIR}/etc/udev/rules.d/71-device-conn-diss.rules"

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 1
	SUDO_USER="${FIRST_USER_NAME}" chmod a+x /etc/init.d/asplashscreen
	echo "Not enabling splash service, to enable it run: sudo insserv /etc/init.d/asplashscreen"
        #SUDO_USER="${FIRST_USER_NAME}" insserv /etc/init.d/asplashscreen
EOF
