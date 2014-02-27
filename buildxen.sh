#!/bin/bash

sudo sh -c "./configure --enable-githttp -libdir=/usr/lib64"
sudo sh -c "make world"
