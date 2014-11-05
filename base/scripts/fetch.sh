#!/bin/bash

# Copyright (c) 2014 Project Iris. All rights reserved.
#
# The current script is part of the official Docker image collection of the
# Iris cloud messaging system, and as such, the same licensing terms apply.
# For details please see http://iris.karalabe.com/downloads#License

# Make sure docker buid fails on any error
set -e

# Check that both file URL and SHA1 hash have been provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <url> <sha1>"
	exit 1
fi
url=$1
name=`basename $url`
sha1=$2

# Download the file and verify its hash
echo "Downloading $name from $url..."    
wget $url

echo "Verifying sha1 checksum ($sha1)..."
echo "$sha1  $name" > $name.sum
sha1sum -c $name.sum
rm $name.sum
