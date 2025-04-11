#!/bin/bash

# Configuration
SUBJECT="RAM usage notification on $(hostname)"
EMAIL="your@mail_id.com"  # Replace with recipient email
THRESHOLD=80 #(set RAM usage limit)
MAIL_CMD="mailx"  # or use 'sendmail' if preferred

# Get memory usage stats
TOTAL_MEM=$(free -m | awk '/^Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/^Mem:/ {print $3}')
USAGE_PERCENT=$(( USED_MEM * 100 / TOTAL_MEM ))
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Compare and notify
if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
    MESSAGE="Warning: High RAM usage detected on $(hostname)
    
Timestamp: $TIMESTAMP
Total Memory: ${TOTAL_MEM}MB
Used Memory: ${USED_MEM}MB
Usage: ${USAGE_PERCENT}%

Threshold: ${THRESHOLD}%"
    
    echo "$MESSAGE" | $MAIL_CMD -s "$SUBJECT" "$EMAIL"
fi
