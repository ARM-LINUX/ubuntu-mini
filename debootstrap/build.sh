tar -pzxf fullbase.tar.gz -C /mnt/tmp
sudo cp sources.list /mnt/tmp/etc/apt/sources.list
sudo cp interfaces /mnt/tmp/etc/network/interfaces
sudo cp hostname /mnt/tmp/etc/hostname
sudo cp hosts /mnt/tmp/etc/hosts
sudo cp fstab /mnt/tmp/etc/fstab
sudo cp mt7601Usta.ko /mnt/tmp/opt/mt7601Usta.ko
sudo cp rc.local /mnt/tmp/etc/rc.local

tar -pzxf mod-fw.tar.gz
mv media/linuxroot/lib/firmware /mnt/tmp/lib/firmware
mv media/linuxroot/lib/modules /mnt/tmp/lib/modules
rm -rf media/

mount -t proc proc /mnt/tmp/proc
mount -t sysfs sysfs /mnt/tmp/sys
mount -o bind /dev /mnt/tmp/dev
mount -t devpts devpts /mnt/tmp/dev/pts
chroot /mnt/tmp locale-gen en_US.utf8
chroot /mnt/tmp

apt-get update
apt-get -y install language-pack-en-base
apt-get -y install sudo isc-dhcp-client udev netbase ifupdown iproute openssh-server iputils-ping wget net-tools wireless-tools wpasupplicant ntpdate ntp less tzdata console-common module-init-tools
apt-get -y upgrade
adduser xjq
gpasswd -a xjq sudo

umount /mnt/tmp/proc
umount /mnt/tmp/sys
umount /mnt/tmp/dev/pts
umount /mnt/tmp/dev
umount /mnt/tmp
