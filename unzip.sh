#!/bin/bash

ZIP_FILE=$1
TEMP_DIR=temp

if [[ -e $ZIP_FILE ]]; then
    unzip -d $TEMP_DIR $ZIP_FILE >/dev/null 2>&1
    RESULT=$?
    if [[ $RESULT -eq 0 || $RESULT == "0" ]]; then
        echo -e "unzip: Done!\n"
    else
        echo -e "unzip: Error $RESULT!\n"
    fi
else
    echo -e "unzip: File not found!\n"
fi
