#!/usr/bin/env bash


setxkbmap -layout br

if [ $? -ne 0 ]; then

  notify-send "Erro ao mudar layout de teclado para `br`"

fi
