

# install missing deps
apt install flex bison

ARCH=arm64 CROSS_COMPILE=/bin/aarch64-linux-gnu- make defconfig
ARCH=arm64 CROSS_COMPILE=/bin/aarch64-linux-gnu- make kvm_guest.config

16384 * 512 = 8388608



- [QEMU - RPi 4](https://gist.github.com/cGandom/23764ad5517c8ec1d7cd904b923ad863)
