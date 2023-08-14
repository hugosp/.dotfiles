#!/bin/bash

## Configs
stow --adopt i3

## Istall I3
sudo apt-get install -y i3 i3lock i3status i3-wm
sudo apt-get install -y rofi


## dependencies 
# Adds libxcb-xrm-dev repository (required!!)
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update

sudo apt-get install -y build-essential
sudo apt-get install -y make
sudo apt-get install -y automake
sudo apt-get install -y autoconf

sudo apt-get install -y libtool
sudo apt-get install -y xutils-dev xcb libxcb-composite0-dev
sudo apt-get install -y doxygen

sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev 
sudo apt-get install -y libxcb-util0-dev libxcb-icccm4-dev libyajl-dev 
sudo apt-get install -y libstartup-notification0-dev libxcb-randr0-dev 
sudo apt-get install -y libev-dev libxcb-cursor-dev libxcb-xinerama0-dev 
sudo apt-get install -y libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
sudo apt-get install -y libxcb-xrm-dev


## Install gaps 
rm -rf /tmp/Airblader
git clone https://github.com/Airblader/i3.git /tmp/Airblader

cd /tmp/Airblader

autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc

make && sudo make install

rm -rf /tmp/Airblader