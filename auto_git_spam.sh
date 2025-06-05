#!/bin/bash

# Configuration
INTERVAL_SECONDS=10                  # <-- change this to the number of seconds between commits
TARGET_FILE="spam_log.java"         # File to modify each time
COMMIT_MESSAGE="auto commit for green square"

echo "Starting Git commit spammer. Commits every $INTERVAL_SECONDS seconds..."

while true
do
  echo "// commit at $(date)" >> $TARGET_FILE
  git add .
  git commit -m "$COMMIT_MESSAGE - $(date)"
  git push

  echo "Committed and pushed at $(date). Sleeping for $INTERVAL_SECONDS seconds..."
  sleep $INTERVAL_SECONDS
done
