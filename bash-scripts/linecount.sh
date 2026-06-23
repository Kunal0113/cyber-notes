#!/bin/bash
#
# Script Name: linecount.sh
# Description: Counts the number of lines in a given file
# Author:      Your Name
# Date:        2026-06-23
# Usage:       ./linecount.sh <filename>

# ----- Strict mode (catch errors early) -----
set -euo pipefail

# ----- Variables -----
SCRIPT_NAME=$(basename "$0")
filename="${1:-}"

# ----- Functions -----

usage() {
    echo "Usage: $SCRIPT_NAME <filename>"
    echo "Description: filename should be the path to the file you want to count lines for"
    exit 1
}

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

check_requirements() {
    # Step 1: Check if a filename was provided
    if [ -z "$filename" ]; then
        echo "Error: No filename provided"
        usage
    fi

    # Step 3: Check if the file actually exists
    if [ ! -f "$filename" ]; then
        echo "Error: File '$filename' does not exist"
        exit 1
    fi
}

main() {
    check_requirements
    log "Starting line count for '$filename'..."

    # Step 4: Count the lines
    line_count=$(wc -l < "$filename")

    # Step 5: Display the result
    echo "The file '$filename' has $line_count lines"

    log "Script finished successfully."
}

# ----- Entry point -----
main "$@"