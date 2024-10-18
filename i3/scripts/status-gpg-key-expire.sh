#/usr/bin/env zsh

#set -x
KEY_EMAIL=${1}

EXPIRE_DATE=$(gpg -k ${KEY_EMAIL} | grep -oE "exp.*" | head -1 | grep -oE "[0-9]{4}-[0-9]{2}-[0-9]{2}" | tr -d '-')

EXPIRE_DATE_SECONDS=$(date --date="${EXPIRE_DATE}" +%s)
NOW_SECONDS=$(date +%s)

ONE_DAY_SECONDS=$((60 * 60 * 24))

EXPIRES_IN=$(( (${EXPIRE_DATE_SECONDS} - ${NOW_SECONDS}) / ${ONE_DAY_SECONDS}))

if [ ${EXPIRES_IN} -gt 60 ];then
    echo ""
    exit 0
fi
if [ ${EXPIRES_IN} -le 7 ];then
  echo "%{+u}%{B#ef5450}%{u#ef5350}  ${EXPIRES_IN}d %{u- B-}%{-u}"
elif [ ${EXPIRES_IN} -le 30 ];then
  echo "%{+u}%{u#ef5350}  ${EXPIRES_IN}d %{u-}%{-u}"
else
  echo " ${EXPIRES_IN}d"
fi
