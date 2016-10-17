#!/bin/sh

# Symlink python 2.7
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python2.7 /usr/bin/python

# Install build tools
yaourt -S ccache repo

# Create source code directory
if [ ! -d ~/Code/android/aosp/cm ]; then
	mkdir -p ~/Code/android/aosp/cm
	echo "Created CyanogenMod source code directory"
fi

# Download source code
cd ~/Code/android/aosp/cm
repo init -u https://github.com/cm-xperience/android.git -b cm-14.0
repo sync

# Download angler specific device code
source build/envsetup.sh
breakfast angler
