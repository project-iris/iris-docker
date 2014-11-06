#!/bin/bash

# Copyright (c) 2014 Project Iris. All rights reserved.
#
# The current script is part of the official Docker image collection of the
# Iris cloud messaging system, and as such, the same licensing terms apply.
# For details please see http://iris.karalabe.com/downloads#License

# Make sure docker buid fails on any error
set -e

# Check that both iris version and SHA1 hash have been provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <iris version> <sha1>"
  exit 1
fi
name=iris-$1-linux-amd64
sha1=$2

# Retrieve the requested version of the Iris node, verify and enable
/scripts/fetch.sh http://iris.karalabe.com/downloads/$name $sha1

mv $name $IRIS_BIN
chmod +x $IRIS_BIN
