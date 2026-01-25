#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/audio-boost.state"
BOOST_LEVEL=1.3
NORMAL_LEVEL=1.0

# Ensure cache dir exists
mkdir -p "$HOME/.cache"

# Wait for default sink (boot-safe)
for i in {1..30}; do
  if wpctl get-volume @DEFAULT_AUDIO_SINK@ >/dev/null 2>&1; then
    break
  fi
  sleep 0.3
done

# Toggle logic
if [[ -f "$STATE_FILE" ]]; then
  # Boost is ON → turn OFF
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $NORMAL_LEVEL
  rm -f "$STATE_FILE"
else
  # Boost is OFF → turn ON
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $BOOST_LEVEL --limit $BOOST_LEVEL
  touch "$STATE_FILE"
fi
