# Arch Install 

# Boot

  - Boot ISO
  - $ loadkeys br-abnt2
  - $ wifi-menu

# Particionar Disco
    - Esquema de partição GPT
    - Primeira pertição, 128MB, tipo: 4 (BIOS Boot)
    - Segunda partição: Todo o restante do disco, tipo: 20 (Linux Filesystem)

# Preparando o disco

  - $ cryptsetup luksFormat `<partição>`
  - $ cryptsetup luksOpen `<partição>` crypt-root
  - $ mke2fs -t ext4 /dev/mapper/crypt-root
  - $ mount /dev/mapper/crypt-root /mnt

# Começando a instalação

  - timedatectl set-ntp true
  - pacstrap /mnt base git zsh vim grub intel-ucode docker dialog sudo wpa_supplicant
  - genfstab -U /mnt >> /mnt/etc/fstab
  - arch-chroot /mnt
  - useradd -m -s /bin/zsh -U -G tty,network,docker,uucp,audio,wheel `<username>`
  - passwd `<daltonmatos>`
  - systemctl enable docker
  - vim /etc/sudoers. Descomentar a linha que permite o grupo wheel fazer sudo
  - ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
  - hwclock --systohc
  - vim /etc/locale.gen (`en_US*`, `pt_BR*`)
  - vim /etc/locale.conf
    - Adicionar linha `LANG=en_US.UTF-8`
  - vim /etc/hostname
  - passwd
  - vim /etc/mkinitcpio.conf
    - Adicoinar `encrypt` na linha `HOOKS=...`. Esse hook deve estar **antes** do hook `filesystems`.
  - mkinitcpio -p linux
  - vim /etc/default/grub 
    - Descomentar a linha `GRUB_ENABLE_CRYPTODISK=y`
    - Adicionar linha: `GRUB_CMDLINE_LINUX="cryptdevice=UUID=<device-UUID>:cryptroot"`, onde `device-UUID` é o UUID da **partição** do disco.
  - grub-mkconfig -o /boot/grub/grub.cfg
  - grub-install --target=i386-pc `/dev/sdX`
  - ^D
  - shutdown -r now

# Boot já no sistema novo

  - $ sudo systemctl {enable,start} NetworkManager
  - Install dotfiles
  - $ _i gnome gdm xf86-video-intel
  - $ _i ttf-*
  - $ _i chromium
  - bzcat .dotfiles/Input.ttf.bz2 > .fonts/Input.ttf
  - fc-cache -rv .fonts
  - Configurar Yubikey

# Configurações adicionais

  - gnupg
  - git 

# Se precisar da boot pelo ISO pra corrigir alguma coisa

  - $ cryptsetup luksOpen `<partição>` crypt
  - $ mount /dev/mapper/crypt /mnt
  - $ pacstrap /mnt `<packages>`

