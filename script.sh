#!/bin/bash

while inotifywait -e close_write ~/.config/waybar/; do
  if pgrep -x "waybar" >/dev/null; then
    pkill -USR2 waybar # Recarga Waybar suavemente si está corriendo
  else
    GTK_DEBUG=interactive waybar & # Reinicia con GTK_DEBUG si se cerró
  fi
done
