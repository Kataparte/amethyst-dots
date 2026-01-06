#!/bin/bash
# Returns only icon + temp (e.g., ⛅ +18°C)
#weather=$(curl -s "wttr.in/?format=%c+%t&u")
weather=$(curl -s "wttr.in/Greensboro?format=%c+%t&u" | xargs)
echo "{\"text\":\"$weather\"}"
