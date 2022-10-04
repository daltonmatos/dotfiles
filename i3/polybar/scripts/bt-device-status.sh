#!/bin/sh

set +x
DEVICE_NAME=${1:-}
ICON_PAIRED=${2:-}
ICON_NOT_PAIRED=${3:-ﳌ}

BAT_PERCENTAGE=""
SHOW_BATT=""

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            device_paired=$(bluetoothctl devices Connected | grep -E "${DEVICE_NAME}" | grep Device | cut -d ' ' -f 2)
            if [ -n "${device_paired}" ]; then
              device_info=$(bluetoothctl info "${device_paired}")
              upower_object="$(echo ${device_paired} | tr ':' '_')"

              if [ ! -z ${SHOW_BATT} ]; then
                BAT_PERCENTAGE=" $(pactl list | grep battery | grep -oE "[0-9]+")%%"
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


main() {
  for opt in "$@"
  do
    case "${opt}" in
      --show-battery)
        SHOW_BATT="yes"
        ;;
  #   icon-on) ICON_PAIRED=${opt}
  #      ;;
  #    icon-off) ICON_NOT_PAIRED=${opt}
  #      ;;
  #    device-name) DEVICE_NAME=${opt}
  #      ;;
    esac
  done
  bluetooth_print
}

main "$@"
