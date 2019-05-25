#!/bin/bash

DAT_FILE=$1
TEMP_DIR=temp

dat2img() {
    FILE_NAME=$(basename $1 .new.dat)
    ./sdat2img/sdat2img.py $TEMP_DIR/$FILE_NAME.transfer.list $1 $TEMP_DIR/$FILE_NAME.img $1 >/dev/null 2>&1
    RESULT=$?
    if [[ $RESULT -eq 0 || $RESULT == "0" ]]; then
        echo -e "dat2img: Done!\n"
    else
        echo -e "dat2img: Error $RESULT!\n"
    fi
}

if [ -e $DAT_FILE ]; then
    dat2img $DAT_FILE
else
    echo -e "dat2img: File not found!\n"
fi
