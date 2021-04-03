#!/usr/bin/env zsh
source ${INCLUDE}/base
import "vars/sudo"

# Para usar o openvpn com --user é preciso criar o TUN/TAP device de forma
# persistente e já com a permissão correta. Caso contrário o openvpn vai falhar
# no primeiro restart pedido pelo OpenVPN Server.
# sudo openvpn --mktun --dev ${DEVICE_NAME} --dev-type tun --user ${USER}
# https://community.openvpn.net/openvpn/wiki/HOWTO#UnprivilegedmodeLinuxonly

OPTION="opnvpn/stg"
DEVICE_NAME="dev"
OPENVPN_PROFILE_PATH=""
STATUS_SCRIPT="${HOME}/.i3/polybar/scripts/openvpn-status.sh"

_connect() {
  sudo \
    -A \
    openvpn \
    --config =(gpg -d ${OPENVPN_PROFILE_PATH}) \
    --user ${USER} \
    --dev ${DEVICE_NAME} \
    --script-security 2 \
    --route-up "${STATUS_SCRIPT} --connected ${DEVICE_NAME}"
}

case "$1" in
    name)
        echo ${OPTION}
        ;;
    *)
        _connect
        ;;
esac
