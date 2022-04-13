#!/bin/bash -e

on_chroot << EOF
#Splash screen
git clone https://github.com/snorain/splashscreen
cd splashscreen
bash install
#Startup sound
git clone https://github.com/QuintOS/startupsound
cd satrtupsound
bash install
EOF
