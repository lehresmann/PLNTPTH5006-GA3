#!/bin/bash
set -euo pipefail

# Placeholder variables
inputfile="$1"
linenumber="$2"

# Print line given line number
tail -n +"$linenumber" "$inputfile" | head -n 1
