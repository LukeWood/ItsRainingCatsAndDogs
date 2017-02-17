#!/usr/bin/bash


# Minimum image dimensions to keep
MIN=150

# Amount of images to keep in each class
KEEP=1000

# Size for crop
W=150
H=150

# Remove any images smaller than MIN
echo "Deleting smaller images"
for f in *.jpg; do
    h=`identify -format "%h" $f`
    w=`identify -format "%w" $f`
    if [[ "$h" -lt "$MIN" || "$w" -lt "$MIN" ]]; then
        rm $f
    fi
done


# Delete extra images
echo "Deleting extra images"
LEFT=`ls -1 cat*.jpg | wc -l`
DELETE=`expr $LEFT - $KEEP`
rm `ls -1 cat*.jpg | tail -n $DELETE`

LEFT=`ls -1 dog*.jpg | wc -l`
DELETE=`expr $LEFT - $KEEP`
rm `ls -1 dog*.jpg | tail -n $DELETE`


# Crop images
echo "Cropping images"
for f in *.jpg; do
    ~/Desktop/aspect ${W}x${H} -m crop $f $f
done
