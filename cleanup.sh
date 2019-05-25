#!/bin/bash

TEMP_DIR=temp

sudo umount -R $TEMP_DIR/system
sudo umount $TEMP_DIR/modem

rm -rf $TEMP_DIR
