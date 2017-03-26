#!/bin/bash

while true
do
  sleep 2
  LOCATION=$(curl -s https://dnsleaktest.com/ | grep flag | cut -d ',' -f 1 | cut -d '>' -f 2 | cut -c 6-)
  echo "Location: $LOCATION"

  if [ -z "$LOCATION" ]; then
    UNABLE_MESSAGE="ERROR: Unable to get location"
    osascript -e "display notification \"$UNABLE_MESSAGE\" with title \"DNS Leak Notifier\""
    continue
  fi

  FOUND=false

  input="$HOME/.dnsleak"
  while IFS= read -r var
  do
    if [[ $var == *"$LOCATION"* ]]; then
      FOUND=true
      echo "Notifying..."
      osascript -e "display notification \"Location: $LOCATION\" with title \"DNS Leak Notifier\""
      break
    fi
  done < "$input"

  if [ "$FOUND" = false ]; then
    echo "None found"
  fi
done
