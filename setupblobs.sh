#!/bin/bash

OTA_FILENAME=$1
TEMP_DIR=temp

if [[ -e $OTA_FILENAME ]]; then
    ./unzip.sh $OTA_FILENAME
    ./decbr.sh $TEMP_DIR/system.new.dat.br
    ./decbr.sh $TEMP_DIR/vendor.new.dat.br
    ./dat2img.sh $TEMP_DIR/system.new.dat
    ./dat2img.sh $TEMP_DIR/vendor.new.dat
    ./mount.sh $TEMP_DIR/system.img $TEMP_DIR/system

    sudo chmod -R 777 $TEMP_DIR/system
    rm -rf $TEMP_DIR/system/vendor

    ./mount.sh $TEMP_DIR/vendor.img $TEMP_DIR/system/vendor
    sudo chmod -R 777 $TEMP_DIR/system/vendor

    RESULT=$?
    if [[ $RESULT -eq 0 || $RESULT == "0" ]]; then
        echo -e "setupblobs: Done!\n"
    else
        echo -e "setupblobs: Error $RESULT!\n"
    fi
else
    echo -e "setupblobs: File not found!\n"
fi
