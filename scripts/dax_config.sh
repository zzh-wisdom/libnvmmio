#!/bin/bash
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sudo rm -rf /mnt/pmem/*
sudo umount /mnt/pmem
sudo mkfs.ext4 -F -b 4096 /dev/pmem0
sudo mount -o dax /dev/pmem0 /mnt/pmem
sudo chown -R $USER:$USER /mnt/pmem

echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sudo rm -rf /mnt/pmem0/*
sudo umount /mnt/pmem0
sudo mkfs.ext4 -F -b 4096 /dev/pmem0
sudo mount -o dax /dev/pmem0 /mnt/pmem0
sudo chown -R $USER:$USER /mnt/pmem0

