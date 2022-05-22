#!/bin/sh

set +x
DEVICE_NAME=${1:-}
ICON_PAIRED=${2:-}
ICON_NOT_PAIRED=${3:-ﳌ}

BAT_PERCENTAGE=""

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            device_paired=$(bluetoothctl paired-devices | grep "${DEVICE_NAME}" | grep Device | cut -d ' ' -f 2)
            if [ -n "${device_paired}" ]; then
              device_info=$(bluetoothctl info "${device_paired}")
              upower_object="$(echo ${device_paired} | tr ':' '_')"

              has_upower_support=$(upower -e | grep ${upower_object})
              if [ -n "${has_upower_support}" ]; then
                BAT_PERCENTAGE=" $(upower -i ${has_upower_support} | grep -i perc | cut -d ':' -f 2 | tr -d ' ')%"
              fi

              if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                printf "${ICON_PAIRED}${BAT_PERCENTAGE}"
              else
                echo "${ICON_NOT_PAIRED}"
              fi

            else
              echo "${ICON_NOT_PAIRED}"
            fi
        fi
}

bluetooth_print
