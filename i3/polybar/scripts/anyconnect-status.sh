#!/usr/bin/env zsh

#set -x
SCRIPT_NAME=$(basename ${0})

LABEL=${1}

while true; do
  RESULT=$(/opt/cisco/anyconnect/bin/vpn status | grep state: | grep ": Connected" | wc -l)
  if [ ${RESULT} -eq 3 ]; then
      echo "%{+u}%{u#00FF00} 聯 ${LABEL} %{u-}%{-u}"
    else
      echo ""
    fi
  sleep 0.5
done
