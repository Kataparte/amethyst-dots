#!/bin/bash
TIME=$(date +%H%M)

# Night mode between 17:25 and 07:30
if [ "$TIME" -ge 1725 ] || [ "$TIME" -le 0730 ]; then
    pgrep -x hyprsunset > /dev/null || hyprsunset -t 5000 &
else
    # Daytime: Kill hyprsunset if it is running
    pkill -x hyprsunset
fi
