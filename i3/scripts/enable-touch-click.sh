#!/usr/bin/env bash

# Enable Tap to click
DEVICE_ID=$(xinput | grep -i touchpad | grep -oE 'id=[0-9]+' | awk -F '=' '{print $2}' | head -1)
TOUCH_PROP_ID=$(xinput list-props ${DEVICE_ID} | grep "Tapping Enabled (" | grep -oE "\([0-9]+\)" | tr -d '()')



xinput set-prop ${DEVICE_ID} ${TOUCH_PROP_ID} 1

if [ $? -ne 0 ]; then
  notify-send "Erro habilitando Tapping do Touchpad"
fi
