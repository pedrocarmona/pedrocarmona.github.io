#!/bin/bash

# Favicon and Apple Touch Icon Generator
#
# This bash script takes an image as a parameter, and uses ImageMagick to convert it to several
# other formats used on modern websites. The following copies are generated:
# 
# * apple-touch-icon-48x48-precomposed.png
# * apple-touch-icon-72x72-precomposed.png
# * apple-touch-icon-96x96-precomposed.png
# * apple-touch-icon-144x144-precomposed.png
# * apple-touch-icon-168x168-precomposed.png
# * apple-touch-icon-192x192-precomposed.png
# * apple-touch-icon.png
# * favicon-16x16.png
# * favicon-32x32.png
# * favicon.ico
#
# Concept from http://bergamini.org/computers/creating-favicon.ico-icon-files-with-imagemagick-convert.html

CONVERT_CMD=`which convert`
# SCRIPT_DIR=`dirname "$0"`
ROOT="static"
SRC_IMAGE=$ROOT"/img/picture.jpeg"

if [ -z $CONVERT_CMD ] || [ ! -f $CONVERT_CMD ] || [ ! -x $CONVERT_CMD ];
then
    echo "ImageMagick needs to be installed to run this script"
    exit;
fi

if [ ! -f $SRC_IMAGE ];
then
    echo "Source image \"$SRC_IMAGE\" does not exist."
    exit;
fi

echo "Generating square base image"
$CONVERT_CMD $SRC_IMAGE -resize 256x256! -transparent white $ROOT/favicon-256x256.png

echo "Generating various sizes for ico"
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 16x16 $ROOT/favicon-16x16.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 32x32 $ROOT/favicon-32x32.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 64x64 $ROOT/favicon-64x64.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 128x128 $ROOT/favicon-128x128.png

echo "Generating ico"
$CONVERT_CMD $ROOT/favicon-16x16.png $ROOT/favicon-32x32.png $ROOT/favicon-64x64.png $ROOT/favicon-128x128.png $ROOT/favicon-256x256.png -colors 256 $ROOT/favicon.ico

echo "Generating touch icons"
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 57x57 $ROOT/apple-touch-icon.png
cp $ROOT/apple-touch-icon.png $ROOT/apple-touch-icon-precomposed.png
cp $ROOT/apple-touch-icon.png $ROOT/apple-touch-icon-57x57-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 48x48 $ROOT/apple-touch-icon-48x48-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 72x72 $ROOT/apple-touch-icon-72x72-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 96x96 $ROOT/apple-touch-icon-96x96-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 144x144 $ROOT/apple-touch-icon-144x144-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 168x168 $ROOT/apple-touch-icon-168x168-precomposed.png
$CONVERT_CMD $ROOT/favicon-256x256.png -resize 192x192 $ROOT/apple-touch-icon-192x192-precomposed.png

echo "Removing temp files"
rm -rf $ROOT/favicon-64x64.png
rm -rf $ROOT/favicon-128x128.png
rm -rf $ROOT/favicon-256x256.png