#!/usr/bin/env zsh

DEV_NAME=${1}
LABEL=${2}
RETURN="聯 ${LABEL}"

running=$(pgrep -a openvpn | grep ${DEV_NAME})
if [ ! -z "${running}" ]; then
  echo ${RETURN}
else
  echo ""
fi
