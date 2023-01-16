#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 1
	ls
        cp -r files/os-release /usr/lib/os-release
	cp -r files/pi-greeter.conf /etc/lightdm/pi-greeter.conf
	cp -r files/asplashscreen /etc/init.d/asplashscreen
	SUDO_USER="${FIRST_USER_NAME}" chmod a+x /etc/init.d/asplashscreen
	echo "Not enabling splash service, to enable it run: sudo insserv /etc/init.d/asplashscreen"
        #SUDO_USER="${FIRST_USER_NAME}" insserv /etc/init.d/asplashscreen
	#devicee noises
	install -v -o 1000 -g 1000 -m 644 "files/device-noise.rule" "${ROOTFS_DIR}/etc/udev/rules.d/71-device-conn-diss.rules"
EOF
