#!/usr/bin/bash

MIN=250
MAX=500

for f in *.jpg; do
    h=`identify -format "%h" $f`
    w=`identify -format "%w" $f`
    if [[ "$h" -lt "$MIN" || "$h" -gt "$MAX" || \
          "$w" -lt "$MIN" || "$w" -gt "$MAX" ]]; then
        rm $f
    fi
done
