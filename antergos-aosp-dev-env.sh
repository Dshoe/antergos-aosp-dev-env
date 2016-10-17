#!/bin/sh

# Symlink python 2.7
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python2.7 /usr/bin/python

# Install build tools
gpg --keyserver pgp.mit.edu --recv-keys 702353E0F7E48EDB # Needed for ncurses5-compat-libs
yaourt -S ccache ncurses5-compat-libs repo schedtool

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

# Prepare ccache
export USE_CCACHE=1
echo export USE_CCACHE=1 >> ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 50G
