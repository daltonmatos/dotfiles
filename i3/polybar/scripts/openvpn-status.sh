#!/usr/bin/env zsh

#set -x
SCRIPT_NAME=$(basename ${0})

DEV_NAME=${1}
LABEL=${2}

connected=0

_connected() {
  OTHER_PID=`pgrep -af ${SCRIPT_NAME} | grep -v -- --connected | grep ${1} | awk '{print $1}'`
  kill -USR1 ${OTHER_PID}
}

_connected_signal_handler() {
  connected=1
}

trap "_connected_signal_handler" USR1

case "${1}" in
  --connected)
      _connected ${2}
      exit 0
      ;;
esac


while true; do
  running=$(pgrep -a openvpn | grep ${DEV_NAME})
  if [ ! -z "${running}" ]; then
    if [ ${connected} -eq 1 ]; then
      echo "%{+u}%{u#00FF00} 聯 ${LABEL} %{u-}%{-u}"
    else
      echo " 輦 ${LABEL} "
    fi
  else
    connected=0
    echo ""
  fi
  sleep 0.5
done
