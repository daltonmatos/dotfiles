#! /usr/bin/env zsh

GCODE_FILE=${1}

for command in $(grep -no "^T[0-9]" ${GCODE_FILE}); do

  
  data=(${(s/:/)command})
  line=${data[1]}

  if ((line > 100)); then
    command_on_line=$((line + 4))
    #echo found=${line}, adding command on ${command_on_line}
    sed -i "${command_on_line}iM600" $GCODE_FILE
  fi

done
