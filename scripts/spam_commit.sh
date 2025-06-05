#!/bin/bash

FILE="spam_log.txt"
MIN_COMMITS=25
MAX_COMMITS=45
COMMITS=$((RANDOM % (MAX_COMMITS - MIN_COMMITS + 1) + MIN_COMMITS))

echo "Starting $COMMITS commits every ~5 mins for up to 6 hours."

for ((i=1; i<=COMMITS; i++)); do
  echo "// commit $i at $(date)" >> $FILE
  git add $FILE
  git commit -m "commit $i - $(date '+%Y-%m-%d %H:%M:%S')"

  JITTER=$((RANDOM % 61)) # random delay between 0 and 60 seconds
  echo "Sleeping for $((300 + JITTER)) seconds..." # 5 mins + jitter
  sleep $((300 + JITTER))
done
