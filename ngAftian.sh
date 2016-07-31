#!/bin/bash

echo "H. Aftian"
echo "========="
echo "Input your device"
echo "============================================================"
echo ""
ROOT_MOUNTPOINT=`mount | grep ' on / ' | cut -d' ' -f1`
ROOT=`/usr/bin/expr substr $ROOT_MOUNTPOINT 1 8`
read -p "USBDISK: " devicevar
if [ x$devicevar == x$ROOT ];then
  echo "Error, it's your system partition"  
  exit 1;
fi
parted  -s $devicevar \
  mktable gpt \
  -- mkpart efi fat32 1 -1 \
  toggle 1 boot
