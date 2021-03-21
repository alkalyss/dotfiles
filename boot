#!/bin/bash

efibootmgr --disk /dev/nvme0n1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=PARTUUID=dae886d6-119c-664b-83e7-c50812db0f71 resume=PARTUUID=7d9ea1af-9c12-8848-adb5-db67bef19942 rw initrd=\intel-ucode.img initrd=\initramfs-linux.img quiet log-level=3 udev.log_level=3 rd.systemd.show_status=auto' --verbose

efibootmgr --disk /dev/nvme0n1 --create --label "Arch Linux Fallback" --loader /vmlinuz-linux --unicode 'root=PARTUUID=dae886d6-119c-664b-83e7-c50812db0f71 resume=PARTUUID=7d9ea1af-9c12-8848-adb5-db67bef19942 rw initrd=\intel-ucode.img initrd=\initramfs-linux-fallback.img log-level=3' --verbose
