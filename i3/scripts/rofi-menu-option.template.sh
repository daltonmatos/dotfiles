#!/usr/bin/env zsh

# Script para ser usado com o rofi-menu.sh. Basta colocar na pasta que é passada ao
# rofi-menu.sh e ter o nome com o prefiro `rofi-menu-*.sh`

OPTION="LABEL-A-SER-EXIBIDA"

_connect() {
  export SUDO_ASKPASS=/home/daltonmatos/.i3/scripts/askpass.sh
  # Código que será chamado quando esse script for escolhido na lista apresentada pelo
  # rofi-menu.sh
}

case "$1" in
    name)
        echo ${OPTION}
        ;;
    *)
        _connect
        ;;
esac
