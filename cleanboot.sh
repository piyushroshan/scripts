#!/bin/bash
echo "Removing unnecesary files"
sudo sh -c "cd /boot/"
sudo sh -c "rm xen-4.3.gz xen-4.gz xen.gz xen-syms-4.3.2"

echo "Updating xencommons xendomains "
sudo sh -c "update-rc.d xencommons defaults 19 18"
sudo sh -c "update-rc.d xendomains defaults 21 22"
sudo sh -c "update-rc.d xen-watchdog defaults 23 22"
sudo sh -c "update-grub"
sudo sh -c "ldconfig"

