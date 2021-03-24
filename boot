#!/bin/bash

efibootmgr -b 0 -B
efibootmgr -b 4 -B

efibootmgr --disk /dev/nvme0n1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=PARTUUID=dae886d6-119c-664b-83e7-c50812db0f71 resume=PARTUUID=7d9ea1af-9c12-8848-adb5-db67bef19942 rw initrd=\intel-ucode.img initrd=\initramfs-linux.img quiet log-level=3 udev.log_level=3 rd.systemd.show_status=auto pci=realloc pci=pcie_scan_all pci=nocrs i8042.nopnp=1 acpi_backlight=video'

efibootmgr --disk /dev/nvme0n1 --create --label "Arch Linux Fallback" --loader /vmlinuz-linux --unicode 'root=PARTUUID=dae886d6-119c-664b-83e7-c50812db0f71 resume=PARTUUID=7d9ea1af-9c12-8848-adb5-db67bef19942 rw initrd=\intel-ucode.img initrd=\initramfs-linux-fallback.img log-level=3'

efibootmgr -o 1,0,4,3
