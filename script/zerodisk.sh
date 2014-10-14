# Zero out the free space to save space in the final image
mount -o remount,compress=no /
dd if=/dev/zero of=/EMPTY bs=1M
sync
rm -f /EMPTY
mount -o remount,compress /
