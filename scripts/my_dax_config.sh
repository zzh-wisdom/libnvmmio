#!/bin/bash
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sudo rm -rf /mnt/pmem2/*
sudo umount /mnt/pmem2
sudo mkfs.ext4 -F -b 4096 /dev/pmem2
sudo mount -o dax /dev/pmem2 /mnt/pmem2
sudo chown -R $USER:$USER /mnt/pmem2

