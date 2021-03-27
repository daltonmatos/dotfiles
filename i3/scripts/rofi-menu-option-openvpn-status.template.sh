#!/usr/bin/env zsh

OPTION="opnvpn/stg"
DEVICE_NAME="dev"
OPENVPN_PROFILE_PATH=""
STATUS_SCRIPT="${HOME}/.i3/polybar/scripts/openvpn-status.sh"

_connect() {
  export SUDO_ASKPASS=/home/daltonmatos/.i3/scripts/askpass.sh
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
