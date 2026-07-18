

# install missing deps
apt install flex bison

ARCH=arm64 CROSS_COMPILE=/bin/aarch64-linux-gnu- make defconfig
ARCH=arm64 CROSS_COMPILE=/bin/aarch64-linux-gnu- make kvm_guest.config




16384 * 512 = 8388608
qemu-system-aarch64 -machine virt -cpu cortex-a72 -smp 6 -m 4G \
    -kernel kernel/Image -append "root=/dev/vda2 rootfstype=ext4 rw panic=0 console=ttyAMA0" \
    -drive format=raw,file=raspios-trixie-arm64-lite.img,if=none,id=hd0,cache=writeback \
    -device virtio-blk,drive=hd0,bootindex=0 \
    -netdev user,id=mynet,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=mynet \
    -monitor telnet:127.0.0.1:5555,server,nowait



- [QEMU - RPi 4](https://gist.github.com/cGandom/23764ad5517c8ec1d7cd904b923ad863)
- [QEMU resize image](https://paulslinuxbox.net/articles/2024/06/02/resizing-qemu-image/)
