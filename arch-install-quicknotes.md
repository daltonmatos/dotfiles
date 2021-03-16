# Arch Install

# Boot

  - Boot ISO
  - $ loadkeys br-abnt2
  - $ wifi-menu

# Particionar Disco
    - Esquema de partição GPT
      - 64MB, tipo: 4 (BIOS Boot)
      - 64MB, tipo: 1 (EFI)
      - Todo o restante do disco, tipo: 20 (Linux Filesystem)

# Se tiveer com multi-disco

    - /var/log/
    - /var/cache/pacman
    - /home/daltonmatos/Documents
    - /home/daltonmatos/Videos
    - /home/daltonmatos/Downloads


# Preparando o disco

  - $ cryptsetup --type=luks1 luksFormat `<partição>`
  - $ cryptsetup luksOpen `<partição>` crypt-root
  - $ mke2fs -t ext4 /dev/mapper/crypt-root
  - $ mount /dev/mapper/crypt-root /mnt

## Partição EFI
 - mkfs.fat -F32 /dev/<particao>


# LVM

 sudo pvcreate /dev/mapper/crypt-ssd
 sudo vgcreate vg01 /dev/mapper/crypt-ssd
 sudo lvcreate -L 20G -n root vg01
 sudo lvcreate -L XGB -n home vg01


## Delsigando volumes LVM
 sudo lvchange -an vg01

# Instalação

## Mínimo necessário para poder já dar boot no sistema novo

  - kernel

  - pacstrap /mnt base lvm2 mkinitcpio dhcpcd git zsh vim grub intel-ucode docker \
            dialog sudo wpa_supplicant automake \
            autoconf make xfce4-terminal \
            netctl i3 gdm chromium \
            pass openssh pv ack hugo \
            gcc make patch wget \
            maim xdotool xorg-xev dunst xorg-xrandr arandr rofi \
            wireless_tools bluez-utils extra/tcl extra/tk fakeroot \
            p7zip unrar gvfs-google \
            file-roller gvfs-gphoto2 gvfs-mtp gvfs-google gtk3 \
            gvfs xfce4-panel tumbler \
            thunar-volman thunar-archive-plugin thunar-media-tags-plugin \
            thunar fd gucharmap

  - timedatectl set-ntp true
  - arch-chroot /mnt
  - mount /dev/<EFI-part> /efi
  - systemctl enable gdm.service
  - hwclock --systohc
  - passwd
  - vim /etc/mkinitcpio.conf
    - Adicionar `encrypt` na linha `HOOKS=...`. Esse hook deve estar **antes** do hook `filesystems`.
    - mkinitcpio -p linux
  - vim /etc/default/grub
    - Descomentar a linha `GRUB_ENABLE_CRYPTODISK=y`
    - Adicionar linha: `GRUB_CMDLINE_LINUX="cryptdevice=UUID=<device-UUID>:cryptroot"`, onde `device-UUID` é o UUID da **partição** do disco.
    - grub-mkconfig -o /boot/grub/grub.cfg
    - grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
  - ^D
  - shutdown -r now

## Passos adicionais que podem ser feitos após o boot

  - useradd -m -s /bin/zsh -U -G tty,network,docker,uucp,audio,wheel `<username>`
  - passwd `<daltonmatos>`
  - systemctl enable docker
  - systemctl enable bluetooth
  - systemctl start bluetooth
  - vim /etc/sudoers. Descomentar a linha que permite o grupo wheel fazer sudo
  - ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
  - vim /etc/locale.gen (`en_US*`, `pt_BR*`)
  - vim /etc/locale.conf
    - Adicionar linha `LANG=en_US.UTF-8`
  - vim /etc/hostname
  - setxkbmap -layput br

# Boot já no sistema novo


## Configs gerais
  - $ _i [xf86-video-intel|nvidia]
  - $ sudo systemctl {enable,start} netctl
  - $ _i noto-fonts{,-emoji} ttf-bitstream-vera ttf-carlito ttf-croscore ttf-dejavu ttf-freefont ttf-droid ttf-liberation ttf-ubuntu-font-family ttf-nerd-fonts-symbols
  - $ _i xf86-video-intel (nvidia-utils, nvidia-settings, nvidia-lts)

  - fc-cache -rv .fonts
    - Instalar `gnome-tweaks` e colocar a fonte regular como Input, 12.

## Configs para desenvolvimento


### Python


  - git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  - escolher qual python usar, com pyenv
  - Instalar:
    - bluetooth-battery
    - bumblebee-status
    - netifaces
    - parso
    - pipenv
    - psutil
    - python-language-server[all]
    - dotbot

### Geral

  - git clone https://github.com/daltonmatos/dotfiles/ ~/.dotfilles
    - cd .dotfiles; dotbot -c install.conf.yaml
  - bzcat .dotfiles/Input.ttf.bz2 > .fonts/Input.ttf
  - Instalar browserpass (https://github.com/browserpass/browserpass)
  - Instalar AUR managaer: yay
  - $ _i code

# Configurações adicionais

  - Configurar Yubikey (https://daltonmatos.com/2018/07/preparando-uma-yubikey-4-nano-para-uso-diario/)
  - gnupg
    - gpg --card-edit
    - fetch (pra pegar a chave pública)
    - gpg --edit-key daltonmatos@gmail.com
      - trust
  - git

## i3

  - Instalar o i3lock-color via pacman. O script de lock depende dele
  - Instalar `rofi`: _i rofi
  - yay rofi-bluetooth-git

### Pacotes

 xorg-*
 xorg-xrandr xorg-xinput

# Se precisar da boot pelo ISO pra corrigir alguma coisa

  - $ cryptsetup luksOpen `<partição>` crypt
  - $ mount /dev/mapper/crypt /mnt
  - $ pacstrap /mnt `<packages>`
