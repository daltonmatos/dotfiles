#!/bin/bash

#set +x
DEVICE_NAME=${1:-}
ICON_PAIRED=${2:-}
ICON_NOT_PAIRED=${3:-ﳌ}

BAT_PERCENTAGE=""
SHOW_BATT=""

# solaar show 1
# mostra detalhes do M720, incluindo valor correto para bateria.

bluetooth_print() {
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            device_paired=$(bluetoothctl devices | grep -E "${DEVICE_NAME}" | grep Device | cut -d ' ' -f 2)
            if [ -n "${device_paired}" ]; then
              device_info=$(bluetoothctl info "${device_paired}")
              upower_object="$(echo ${device_paired} | tr ':' '_')"
              device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

              if [ ! -z ${SHOW_BATT} ]; then
                if is_logitech_mouse ${device_alias}; then
                  SOLAAR_OUT=$(solaar show 1 2>/dev/null)
                  SOLAAR_OK=$?
                  if [ ${SOLAAR_OK} -eq 1 ]; then
                    BAT_PERCENTAGE=" "
                  else
                    BAT_PERCENTAGE=" $( solaar show 1 | grep -i battery: | tail -1 | grep -oE "[0-9]+" | head -1)%%"
                  fi
                else
                  BAT_PERCENTAGE=" $(pactl list | grep battery | grep -oE "[0-9]+")%%"
                fi
              fi

              if echo "$device_info" | grep -q "Connected: yes"; then
                printf "${ICON_PAIRED}${BAT_PERCENTAGE}"
              else
                echo "${ICON_NOT_PAIRED}"
              fi

            else
              echo "${ICON_NOT_PAIRED}"
            fi
        fi
}


is_logitech_mouse() {

echo ${1} | grep "M720" >/dev/null
return $?

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
