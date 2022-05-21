#!/usr/bin/env bash

setxkbmap -layout us,br -variant intl,abnt2

if [ $? -ne 0 ]; then

  notify-send "Erro ao mudar layout de teclado para `br`"

fi
