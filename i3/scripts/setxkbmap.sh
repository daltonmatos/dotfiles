#!/usr/bin/env bash


#setxkbmap -layout br
setxkbmap -layout us -variant intl

if [ $? -ne 0 ]; then

  notify-send "Erro ao mudar layout de teclado para `br`"

fi
