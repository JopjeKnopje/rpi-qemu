#!/bin/bash
qemu-system-aarch64 -machine virt -cpu cortex-a72 -smp 6 -m 4G \
    -kernel qemu/kernel/Image -append "root=/dev/vda2 rootfstype=ext4 rw panic=0 console=ttyAMA0" \
    -drive format=raw,file=qemu/raspios-trixie-arm64-lite.img,if=none,id=hd0,cache=writeback \
    -device virtio-blk,drive=hd0,bootindex=0 \
    -netdev tap,ifname=tap0,id=mynet \
    -device virtio-net-pci,netdev=mynet \
    -monitor telnet:127.0.0.1:5555,server,nowait




