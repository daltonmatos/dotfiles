#!/usr/bin/env zsh

#set -x
CURRENT_HEALTH=$(echo $(( ($(cat /sys/class/power_supply/BAT0/charge_full) / 1.0) / ($(cat /sys/class/power_supply/BAT0/charge_full_design) / 1.0) * 100 )))
CURRENT_HEALTH_INTEGER=$(printf "%d" ${CURRENT_HEALTH})

while true; do
  has_wall_power=$(cat /sys/class/power_supply/AC/online)
  if [ ${has_wall_power} -ne 1 ]; then
      echo "%{+u}%{u#CACACA}  ${CURRENT_HEALTH_INTEGER} %{u-}%{-u}"
    else
      echo ""
    fi
  sleep 0.5
done
