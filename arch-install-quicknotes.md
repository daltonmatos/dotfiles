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
  - pacstrap /mnt base git zsh vim grub intel-ucode docker dialog sudo wpa_supplicant automake autoconf make xfce4-terminal
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


## Configs gerais
  - $ _i i3[-gaps?] gdm [xf86-video-intel|nvidia]
  - $ sudo systemctl {enable,start} NetworkManager
  - $ _i noto-fonts ttf-bitstream-vera ttf-carlito ttf-croscore ttf-dejavu ttf-freefont ttf-droid ttf-liberation ttf-ubuntu-font-family
  - $ _i gdm xf86-video-intel (nvidia-utils, nvidia-settings, nvidia-lts)
  - $ _i chromium
  - $ _i pass openssh pv ack hugo gcc make patch wget maim xdotool xorg-xev
  - fc-cache -rv .fonts
    - Instalar `gnome-tweaks` e colocar a fonte regular como Input, 12.

## Configs para desenvolvimento

  - Install dotfiles (https://github.com/daltonmatos/dotfiles/)
    - pip install --user dotbot
    - cd .dotfiles; dotbot -c install.conf.yaml
  - git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  - bzcat .dotfiles/Input.ttf.bz2 > .fonts/Input.ttf
  - Configurar Yubikey (https://daltonmatos.com/2018/07/preparando-uma-yubikey-4-nano-para-uso-diario/)
  - Instalar browserpass (https://github.com/browserpass/browserpass)
  - pip install --user python-language-server[all] isort
  - Instalar AUR managaer: yay

# Configurações adicionais

  - gnupg
    - gpg --card-edit
    - fetch (pra pegar a chave pública)
    - gpg --edit-key daltonmatos@gmail.com
      - trust
  - git

## i3

  - Instalar o i3lock-color via PKGBUILD. O script de lock depende dele
    - Baixar o PKGBUILD
    - makepkg -si

### Pacotes

 xorg-*
 xorg-xrandr xorg-xinput

# Se precisar da boot pelo ISO pra corrigir alguma coisa

  - $ cryptsetup luksOpen `<partição>` crypt
  - $ mount /dev/mapper/crypt /mnt
  - $ pacstrap /mnt `<packages>`
