parted  -s /dev/sdb \
  mktable gpt \
  -- mkpart efi fat32 1 -1 \
  toggle 1 boot
