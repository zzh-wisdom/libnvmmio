#!/bin/bash
# gdb --args env \
LD_PRELOAD=../../src/libnvmmio.so \
numactl --cpunodebind=1 --membind=1 \
src/fio \
--name=test \
--ioengine=sync \
--rw=read \
--directory=/mnt/pmem0 \
--filesize=1024m \
--bs=4096 \
--thread --numjobs=4 \
--runtime=30 --time_based \
--overwrite=1

