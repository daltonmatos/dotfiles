#!/usr/bin/env bash

pkill polybar

export PRIMARY_DISPLAY=$(xrandr -q | grep conn | grep primary | awk '{print $1}')

polybar --reload --config=~/.i3/polybar/config main
