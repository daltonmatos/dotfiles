#!/bin/sh
# https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/notification-spacex

spacex_launch=$(curl -sf https://api.spacexdata.com/v4/launches/next)

if [ -n "$spacex_launch" ]; then
    spacex_precision=$(echo "$spacex_launch" | jq -r '.date_precision' )
    spacex_timestamp=$(echo "$spacex_launch" | jq -r '.date_unix' )
    spacex_mission_name=$(echo "$spacex_launch" | jq -r '.name' )
    spacex_duration=$((spacex_timestamp - $(date +%s)))

    if [ "$spacex_precision" = "hour" ] && [ "$spacex_duration" -lt 43200 ] && [ "${spacex_duration}" -gt 0 ]; then
        echo " ${spacex_mission_name} $(date +"%Hh%Mm" -u --date @$spacex_duration)"
    else
        echo ""
    fi
else
    echo ""
fi
