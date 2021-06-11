#!/bin/bash

cd ~/

mkdir ubuntu-fs

cd ubuntu-fs

wget http://cdimage.ubuntu.com/ubuntu-base/releases/21.04/release/ubuntu-base-21.04-base-riscv64.tar.gz

FOCAL=ubuntu-base-20.04.1-base-riscv64.tar.gz

tar -xzf $FOCAL

echo Writing launch script

rm -rf ~/ubuntu-fs/etc/resolv.conf

cp /etc/resolv.conf ~/ubuntu-fs/etc

cd ~/

touch startubuntu.sh

echo mount -t proc /proc ~/ubuntu-fs/proc >> ~/startubuntu.sh

echo mount -o bind /sys ~/ubuntu-fs/sys >> ~/startubuntu.sh

echo mount -o bind /dev ~/ubuntu-fs/dev >> ~/startubuntu.sh

echo mount --make-rslave ~/ubuntu-fs/sys >> ~/startubuntu.sh

echo mount --make-rslave ~/ubuntu-fs/dev >> ~/startubuntu.sh

echo chroot ~/ubuntu-fs >> ~/startubuntu.sh



echo Finished. Start Ubuntu Chroot with sudo bash ub.sh
