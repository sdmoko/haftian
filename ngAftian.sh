#!/bin/bash

DEVICE=/dev/sdb

parted  -s $DEVICE \
  mktable gpt \
  -- mkpart efi fat32 1 -1 \
  toggle 1 boot
