#!/bin/bash

IMG_FILE=$1
MOUNT_POINT=$2

mountimg() {
    FILENAME=$(basename $1 .img)
    if [[ $FILENAME == "system" || $FILENAME == "vendor" || $FILENAME == "modem" ]]; then
        sudo mount -o loop $1 $2
        RESULT=$?
        if [[ $RESULT -eq 0 || $RESULT == "0" ]]; then
            echo -e "mount: Done!\n"
        else
            echo -e "mount: Error $RESULT!\n"
        fi
    else
        echo -e "mount: $1 not support!\n"
    fi
}

if [ -e $DAT_FILE ]; then
    if [ x$MOUNT_POINT == "x" ]; then
        echo -e "mount: Mountpoint not found!\n"
        exit
    elif [ ! -d $MOUNT_POINT ]; then
        mkdir $MOUNT_POINT
    fi
    mountimg $IMG_FILE $MOUNT_POINT
else
    echo -e "mount: File not found!\n"
fi
