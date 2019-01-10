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

# Preparando o disco

  - $ cryptsetup luksFormat `<partição>`
  - $ cryptsetup luksOpen `<partição>` crypt-root
  - $ mke2fs -t ext4 /dev/mapper/crypt-root
  - $ mount /dev/mapper/crypt-root /mnt

# Instalação

## Mínimo necessário para poder já dar boot no sistema novo

  - timedatectl set-ntp true
  - pacstrap /mnt base git zsh vim grub intel-ucode docker dialog sudo wpa_supplicant automake autoconf make
  - arch-chroot /mnt
  - hwclock --systohc
  - passwd
  - vim /etc/mkinitcpio.conf
    - Adicionar `encrypt` na linha `HOOKS=...`. Esse hook deve estar **antes** do hook `filesystems`.
    - mkinitcpio -p linux
  - vim /etc/default/grub 
    - Descomentar a linha `GRUB_ENABLE_CRYPTODISK=y`
    - Adicionar linha: `GRUB_CMDLINE_LINUX="cryptdevice=UUID=<device-UUID>:cryptroot"`, onde `device-UUID` é o UUID da **partição** do disco.
    - grub-mkconfig -o /boot/grub/grub.cfg
    - grub-install --target=i386-pc `/dev/sdX`
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

# Boot já no sistema novo

  - Install dotfiles (https://github.com/daltonmatos/dotfiles/)
  - git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  - $ _i gnome gdm [xf86-video-intel|nvidia]
  - $ sudo systemctl {enable,start} NetworkManager
  - $ _i noto-fonts ttf-bitstream-vera ttf-carlito ttf-croscore ttf-dejavu ttf-freefont ttf-droid ttf-liberation ttf-ubuntu-font-family
  - $ _i gnome gdm xf86-video-intel (nvidia-utils, nvidia-settings, nvidia-lts)
  - $ _i chromium
  - $ _i pass openssh pv ack hugo gcc make patch wget
  - bzcat .dotfiles/Input.ttf.bz2 > .fonts/Input.ttf
  - fc-cache -rv .fonts
    - Instalar `gnome-tweaks` e colocar a fonte regular como Input, 12.
  - Configurar Yubikey (https://daltonmatos.com/2018/07/preparando-uma-yubikey-4-nano-para-uso-diario/)
  - Instalar browserpass (https://github.com/browserpass/browserpass)
  - Instalar AUR managaer: yay
  - yay snapd
  - systemctl enable/start snapd.socket

# Configurações adicionais

  - gnupg
    - gpg --card-edit
    - fetch (pra pegar a chave pública)
    - gpg --edit-key daltonmatos@gmail.com
      - trust
  - git 

## i3

### Pacotes

 xorg-*
 xorg-xrandr xorg-xinput

### Compilando polybar

Instala python 2.7.15 via pyenv, copia o módulo xcbgen do python global (pode ser o 3.7) para dentro do `site-packages` do 2.7.15.


pwd   
/home/daltonmatos/.pyenv/versions/2.7.15/lib/python2.7/site-packages
cp -a /usr/lib/python3.7/site-packages/xcbgen .



# Se precisar da boot pelo ISO pra corrigir alguma coisa

  - $ cryptsetup luksOpen `<partição>` crypt
  - $ mount /dev/mapper/crypt /mnt
  - $ pacstrap /mnt `<packages>`

