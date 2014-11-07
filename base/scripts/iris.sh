#!/bin/bash

# Copyright (c) 2014 Project Iris. All rights reserved.
#
# The current script is part of the official Docker image collection of the
# Iris cloud messaging system, and as such, the same licensing terms apply.
# For details please see http://iris.karalabe.com/downloads#License

# Check if an RSA key was uploaded and add the flag accordingly
flags=""
if [ -f $IRIS_RSA ]; then
	flags="-rsa $IRIS_RSA"
fi

# Pass all provided arguments to Iris
exec $IRIS_BIN $@ $flags
