#!/usr/bin/env bash

which dunst > /dev/null

if [ $? -ne 0 ]; then

i3-nagbar -t error -m 'Binário do `dunst` não encontrado. Notificações não funcionarão.' -f 'pango:Inconsolata'

fi
