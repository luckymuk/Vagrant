#!/bin/bash

sudo curl -O -L -J http://10.1.10.150:8080/installations/rhcos-4.4.3-x86_64-installer-kernel-x86_64
sudo curl -O -L -J http://10.1.10.150:8080/installations/rhcos-4.4.3-x86_64-installer-initramfs.x86_64.img
sudo mv rhcos-4.4.3-x86_64-installer-kernel-x86_64 /boot/vmlinuz-rhcos
sudo mv rhcos-4.4.3-x86_64-installer-initramfs.x86_64.img /boot/initramfs-rhcos.img

sudo grubby --add-kernel=/boot/vmlinuz-rhcos --args="ip=10.1.10.203::10.1.10.1:255.255.255.0:master-3.openshift.aspenlab:ens6:none nameserver=10.1.10.150 rd.neednet=1 coreos.inst=yes coreos.inst.install_dev=vda coreos.inst.image_url=http://10.1.10.150:8080/installations/rhcos-4.4.3-x86_64-metal.x86_64.raw.gz coreos.inst.ignition_url=http://10.1.10.150:8080/installations/master.ign console=ttyS0" --initrd=/boot/initramfs-rhcos.img --make-default --title=rhcos
sudo reboot
Watch the console to see if it worked
add core user to UDF to each of the VM's you did the above provedure to.

ssh into it once it is up as core user.
journalctl -af
