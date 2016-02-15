# Make a speed test on the SD card
#
# v 0.1.0
#
############################################

echo "WRITE TEST"
dd if=/dev/zero of=~/test.tmp bs=500K count=1024

sync; echo 3 | sudo tee /proc/sys/vm/drop_caches

echo "READ TEST"
dd if=~/test.tmp of=/dev/null bs=500K count=1024


echo "OTHER TEST"
sudo hdparm -tT /dev/mmcblk0
