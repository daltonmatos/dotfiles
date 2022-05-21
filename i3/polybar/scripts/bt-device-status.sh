#!/bin/sh

DEVICE_NAME=${1:-}
ICON_PAIRED=${2:-}
ICON_NOT_PAIRED=${3:-ﳌ}

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            devices_paired=$(bluetoothctl paired-devices | grep "${DEVICE_NAME}" | grep Device | cut -d ' ' -f 2)
            device_info=$(bluetoothctl info "${devices_paired}")

            if echo "$device_info" | grep -q "Connected: yes"; then
                #bat_level=$(/home/daltonmatos/.pyenv/shims/bluetooth_battery "${devices_paired}" | cut -d ' ' -f 6)
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                #printf " %s" "${bat_level}"
                printf "${ICON_PAIRED}"
              else
                echo "${ICON_NOT_PAIRED}"
            fi
        fi
}

bluetooth_print
