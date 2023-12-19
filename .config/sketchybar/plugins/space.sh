#!/bin/sh

source "$HOME/bin/colors"

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
if [ "$SELECTED" = "true" ]; then
  sketchybar --set $NAME icon.color=$YELLOWHEX
else
  sketchybar --set $NAME icon.color=$WHITEHEX
fi
