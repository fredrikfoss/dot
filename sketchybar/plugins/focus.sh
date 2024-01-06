#!/usr/bin/env bash

WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')
# APP=$(yabai -m query --windows --window | jq -r '.app')
# ICON=$($HOME/.config/sketchybar/scripts/icons $APP)

if [[ ${#WINDOW_TITLE} -gt 40 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-40)…
fi

# if [[ $APP = $WINDOW_TITLE ]]; then
#   # sketchybar -m --set focus label="$APP" icon="$ICON"
#   sketchybar -m --set focus label="$APP"
#   exit 0
# fi

sketchybar -m --set focus label="$WINDOW_TITLE"
