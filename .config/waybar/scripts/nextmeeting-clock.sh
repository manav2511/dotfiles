#!/bin/bash
set -o noglob

# Text on the bar
time=$(date '+%H:%M | %a %d %b')

# Tooltip (multiline)
tooltip=$(nextmeeting --json | jq -r '.tooltip')
[ -z "$tooltip" ] && tooltip="No upcoming meetings"

# escape JSON
time="${time//\"/\\\"}"
tooltip="${tooltip//\"/\\\"}"
tooltip="${tooltip//$'\n'/\\n}"

# NOW output "text" AND "alt"
printf '{"text":"%s","alt":"%s"}\n' "$time" "$tooltip"
