#!/bin/bash

BR_FILE=$1
TEMP_DIR=temp

decompress() {
    FILE_NAME=$(basename $1 .br)
    brotli -d -o $TEMP_DIR/$FILE_NAME $1 >/dev/null 2>&1
    RESULT=$?
    if [[ $RESULT -eq 0 || $RESULT == "0" ]]; then
        echo -e "brotli: Done!\n"
    else
        echo -e "brotli: Error $RESULT!\n"
    fi
}

if [ -e $BR_FILE ]; then
    decompress $BR_FILE
else
    echo -e "brotli: File not found!\n"
fi
