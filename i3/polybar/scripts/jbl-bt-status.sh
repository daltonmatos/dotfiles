#!/bin/sh

# Device Class:
# JBL GO: 0x00200414
# JBL TUNEBT500: 0x00240404

DEVICE_NAME=${1:-}

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            devices_paired=$(bluetoothctl paired-devices | grep "${DEVICE_NAME}" | grep Device | cut -d ' ' -f 2)
            device_info=$(bluetoothctl info "${devices_paired}")

            if echo "$device_info" | grep -q "Connected: yes"; then
                #bat_level=$(/home/daltonmatos/.pyenv/shims/bluetooth_battery "${devices_paired}" | cut -d ' ' -f 6)
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                #printf " %s" "${bat_level}"
                printf ""
              else
                echo "ﳌ"
            fi
        fi
}

bluetooth_print
