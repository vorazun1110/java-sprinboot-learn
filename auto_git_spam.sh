#!/bin/bash

# Configuration
INTERVAL_SECONDS=30                  # Delay between commits
MAX_COMMITS=10                       # Total number of commits to make
TARGET_FILE="spam_log.java"         # File to modify each time
COMMIT_MESSAGE="auto commit for green square"

echo "🚀 Starting Git commit spammer for $MAX_COMMITS commits. Interval: $INTERVAL_SECONDS seconds."

for ((i=1; i<=MAX_COMMITS; i++))
do
  echo "// commit #$i at $(date)" >> $TARGET_FILE
  git add .
  git commit -m "$COMMIT_MESSAGE #$i - $(date)"
  git push

  echo "✅ Commit #$i pushed. Sleeping for $INTERVAL_SECONDS seconds..."
  sleep $INTERVAL_SECONDS
done

echo "🎉 Completed $MAX_COMMITS commits. Exiting script."
