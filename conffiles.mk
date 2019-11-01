conffiles = $(boot_conf) $(linker_conf) $(filesystem_conf) \
            $(users_conf) $(login_conf) $(profile_conf) $(pkg_conf) \
            $(sudo_conf)

execfiles = pacman.d/hooks/rank-mirrorlist.sh

securefiles = crypttab shadow gshadow sudoers


boot_conf = default/grub

linker_conf = ld.so.conf

filesystem_conf = crypttab fstab.d/bios fstab.d/uefi fstab.d/usb

users_conf = passwd shadow group gshadow

login_conf = securetty issue motd shells

profile_conf = profile

pkg_conf = pacman.conf pacman.d/hooks/rank-mirrorlist.hook \
           pacman.d/hooks/rank-mirrorlist.sh

sudo_conf = sudoers
