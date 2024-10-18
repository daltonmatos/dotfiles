#!/usr/bin/env zsh

#set -x
NETSKOPE_BIN_PATH="/opt/netskope/stagent/stAgentCli"
SCRIPT_NAME=$(basename ${0})

LABEL=${1}

while true; do
  BYTES_SENT=$(${NETSKOPE_BIN_PATH} show-pa | grep Sent: | grep -oE '[0-9]+')
  IS_CONNECTED=$(${NETSKOPE_BIN_PATH} show-pa | grep Status: | awk '{print $2}')

  if [ ${BYTES_SENT} -gt 0 ] || [ "${IS_CONNECTED}" = "Connected" ]; then
      echo "%{+u}%{u#00FF00} 聯 ${LABEL} %{u-}%{-u}"
    else
      echo ""
    fi
  sleep 0.5
done
