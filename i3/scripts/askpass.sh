#!/usr/bin/env zsh

# Script pata ser usado como o valor do `SUDO_ASKPASS` para podermos
# ter um input gráfico para digitar o password

rofi -i -lines 0 -p " " -dmenu -password -theme ~/.i3/rofi/dialogs/askpass.rasi
