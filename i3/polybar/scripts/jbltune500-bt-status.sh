#!/bin/sh

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            devices_paired=$(bluetoothctl paired-devices | grep TUNE | grep Device | cut -d ' ' -f 2)
            device_info=$(bluetoothctl info "${devices_paired}")

            bat_level=$(/home/daltonmatos/.pyenv/shims/bluetooth_battery "${devices_paired}" | cut -d ' ' -f 6)
            if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                #printf " %s" "$(echo $device_alias | cut -d ' ' -f 1) ${bat_level}"
                printf " %s" "${bat_level}"
              else
                echo "ﳌ"
            fi
        fi
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
