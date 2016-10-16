#!/bin/sh

# Install repo
if [ ! -d ~/bin ]; then
	mkdir -p ~/bin
	echo "Created ~/bin directory"
fi
if [ ! -f ~/bin/repo ]; then
	curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	chmod a+x ~/bin/repo
	echo "Installed repo"
fi

# Add this to ~/.bashrc
# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# Create source code directory
if [ ! -d ~/Code/android/cm ]; then
	mkdir -p ~/Code/android/cm
	echo "Created CyanogenMod source code directory"
fi

# Download source code
cd ~/Code/android/cm
repo init -u https://github.com/CyanogenMod/android.git -b cm-14.0
repo sync
