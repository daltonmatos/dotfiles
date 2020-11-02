#!/usr/bin/env zsh

# Script pata ser usado como o valor do `SUDO_ASKPASS` para podermos
# ter um input gráfico para digitar o password

rofi -lines 0 -p "Password" -dmenu -password
