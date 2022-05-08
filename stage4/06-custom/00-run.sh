#!/bin/bash -e

on_chroot << EOF
#Splash screen
git clone https://github.com/snorain/splashscreen
cd splashscreen
bash install
cd ..
rm -rf splashscreen
#Startup sound
git clone https://github.com/snorain/startupsound
cd startupsound
bash install
cd ..
rm -rf startupsound
EOF
#devicee noises
install -v -o 1000 -g 1000 -m 644 "files/device-noise.rules" "${ROOTFS_DIR}/etc/udev/rules.d/71-device-conn-diss.rules"
