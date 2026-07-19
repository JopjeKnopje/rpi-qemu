# Plan 
- Run my code on localhost 
- copy over its genereated venv to pi
- if thate works setup pyinfra for us to automate that



# QEMU Setup
## Resizing QEMU image

[QEMU resize image](https://paulslinuxbox.net/articles/2024/06/02/resizing-qemu-image/)



## QEMU Networking
I wanna use a bridge with a TAP device instead of the default setup which is called [`SLIRP`](https://wiki.qemu.org/Documentation/Networking#Network_Backends)
That way the VM will be joined into the hosts LAN.

The hosts traffic will go through the bridge, and then to the phyiscal interface. When you run `ip r` you'll see all the routes are going through `br0`.



```bash
# clear ip host phyiscal nic
ip link set dev enp42s0 down
ip a flush dev enp42s0

ip tuntap add dev tap0 mode tap
ip link add br0 type bridge
ip link set dev tap0 master br0   # set br0 as the target bridge for tap0
ip link set dev eth0 master br0   # set br0 as the target bridge for eth0
# get them back up
ip link set dev enp42s0 up
ip link set dev tap0 up
ip link set dev br0 up
```


## Increase /tmp size for pip install
```bash
mount -o remount,size=5G /tmp/
```



## Fixing illegal instruction
