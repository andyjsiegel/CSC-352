#!/bin/bash

# Enhanced grading wrapper script
# Usage: grade.sh [directory] <base_name> [test_files...]
# If directory is provided, it will cd there first
# Examples:
#   grade.sh countPrimes                    # Grade in current directory
#   grade.sh assg1/prob1 countPrimes        # Grade in assg1/prob1 directory
#   grade.sh ../prob2 calcFactorial test1.in # Grade in ../prob2 with specific test

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Check if first argument looks like a directory
if [ $# -ge 2 ] && [ -d "$1" ]; then
    TARGET_DIR="$1"
    shift
    echo "Changing to directory: $TARGET_DIR"
    cd "$TARGET_DIR" || { echo "Failed to change to directory $TARGET_DIR"; exit 1; }
fi

# Now run the batch grading script
"$SCRIPT_DIR/batch_grade.sh" "$@"
