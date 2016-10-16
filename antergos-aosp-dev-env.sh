#!/bin/sh

# Create directories
if [ ! -d ~/Code/android/aosp ]; then
	mkdir -p ~/Code/android/aosp
	echo "Created AOSP source code directory"
fi
