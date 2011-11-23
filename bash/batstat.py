#!/usr/bin/env python
#encoding: utf-8

import os

BASE = '/proc/acpi/battery/BAT0'

STATE = os.path.join(BASE, 'state')
INFO = os.path.join(BASE, 'info')


def build_hash(file):
    h = {}
    if not os.path.exists(file):
        return {}
    for line in open(file):
        key, value = line.split(':')
        h[key.replace(' ', '').strip()] = value.strip().strip('\n')
    return h


state_hash = build_hash(STATE)
info_hash = build_hash(INFO)
#print state_hash, info_hash

total_capacity = int(info_hash['designcapacity'].split()[0])
current_capacity = int(state_hash['remainingcapacity'].split()[0])

total = int(float(current_capacity) / float(total_capacity) * 10)
bars = total * "|"
print "-{0}{1}+".format(bars, (10 - total) * ' ')



