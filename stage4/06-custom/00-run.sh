#!/bin/bash -e

on_chroot << EOF
#Splash screen
git clone https://github.com/snorain/splashscreen
cd splashscreen
ls
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
