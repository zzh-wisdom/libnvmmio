#!/bin/bash
# LD_PRELOAD=../../src/libnvmmio.so \
# numactl --cpunodebind=1 --membind=1 \
# src/fio \
# --name=test \
# --ioengine=sync \
# --rw=randrw \
# --rwmixwrite=25 \
# --directory=/mnt/pmem2 \
# --filesize=3072m \
# --bs=64 \
# --thread --numjobs=1 \
# --runtime=30 --time_based \
# --unified_rw_reporting=1 \
# --bssplit=1k\/16:512B\/16:256B\/16:128B\/16:64B\/16:2k\/ \

# LD_PRELOAD=../../src/libnvmmio.so \
# numactl --cpunodebind=1 --membind=1 \
# src/fio \
# --name=test \
# --ioengine=sync \
# --rw=randread \
# --directory=/mnt/pmem2 \
# --filesize=1024m \
# --bs=4k \
# --thread --numjobs=2 \
# --runtime=30 --time_based

# LD_PRELOAD=../../src/libnvmmio.so \
# numactl --cpunodebind=1 --membind=1 \
# src/fio \
# --name=test \
# --ioengine=sync \
# --rw=randrw \
# --directory=/mnt/pmem2 \
# --filesize=1024m \
# --bs=4k \
# --thread --numjobs=1 \
# --runtime=30 --time_based \
# --rwmixwrite=25 \
# --bssplit=1k/16:512B/16:256B/16:128B/16:64B/16:2k/ \
# --unified_rw_reporting=1

LD_PRELOAD=../../src/libnvmmio.so \
numactl --cpunodebind=1 --membind=1 \
fio fs_small_vary.fio

LD_PRELOAD=../../src/libnvmmio.so fio fs_small_vary.fio
