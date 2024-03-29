#!/usr/bin/env bash


OPTIONS_FOLDER=${1:-}


_exit() {
  echo "Usage: ${0} <folder>"
}

[[ -z ${OPTIONS_FOLDER} ]] && _exit

declare -A MAP

files=$(find ${OPTIONS_FOLDER} -executable -maxdepth 1 -type f -name 'rofi-menu-*.sh')

options=""

if [ -z "${files}" ]; then
  rofi -dmenu -p "Nenhuma opcao encontrada"
  exit 0
fi

for f in ${files}; do
  name=$(${f} name)
  MAP[${name}]=${f}
  options="${options}${name}\n"
done

selected=$(echo -e ${options} | rofi -dmenu -p "聯 " -theme dialogs/listpick.rasi)

${MAP[${selected}]} ${selected}
