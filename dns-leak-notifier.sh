#!/bin/bash

log () {
  echo "$(date) $1"
}

while true
do
  sleep 30
  LOCATION=$(curl -s https://dnsleaktest.com/ | grep flag | awk -F '[<>]' '{print $3}' | cut -d ',' -f 1)
  log "Location: $LOCATION"

  if [ -z "$LOCATION" ]; then
    UNABLE_MESSAGE="ERROR: Unable to get location"
    osascript -e "display notification \"$UNABLE_MESSAGE\" with title \"DNS Leak Notifier\""
    continue
  fi

  FOUND=false

  input="$HOME/.dnsleak"
  while IFS= read -r var
  do
    if [[ $LOCATION == *"$var"* ]]; then
      FOUND=true
      log "Recognized location: $var"
      break
    fi
  done < "$input"

  if [ "$FOUND" = false ]; then
    log "Notifying..."
    osascript -e "display notification \"Unrecognized location: $LOCATION\" with title \"DNS Leak Notifier\""
  fi
done
