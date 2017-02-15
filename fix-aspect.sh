#!/usr/bin/bash

WIDTH=500
HEIGHT=500

mkdir padded

for f in *.jpg; do
    ./aspect ${WIDTH}x${HEIGHT} -m pad $f padded/$f
done
