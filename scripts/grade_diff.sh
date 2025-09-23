#!/bin/bash

# Grading script to compare stdout and return codes between base executable and ex version
# Usage: ./grade_diff.sh <base_name> <input_file>
# Examples: 
#   ./grade_diff.sh countPrimes test.in (compares countPrimes vs exCountPrimes)
#   ./grade_diff.sh calcFactorial test.in (compares calcFactorial vs exCalcFactorial)
#   ./grade_diff.sh mirrorSum test.in (compares mirrorSum vs exMirrorSum)
# Returns 0 if both stdout and return codes match, 1 if different, 2 if error

if [ $# -ne 2 ]; then
    echo "Usage: $0 <base_name> <input_file>" >&2
    echo "Examples:" >&2
    echo "  $0 countPrimes test.in" >&2
    echo "  $0 calcFactorial test.in" >&2
    echo "  $0 mirrorSum test.in" >&2
    exit 2
fi

BASE_NAME="$1"
INPUT_FILE="$2"
EX_NAME="ex${BASE_NAME^}"  # Capitalize first letter and prepend 'ex'

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found" >&2
    exit 2
fi

if [ ! -x "./$BASE_NAME" ]; then
    echo -e "\033[31mError:\033[0m $BASE_NAME executable not found or not executable\nRun \033[38;5;208mgcc -Wall $BASE_NAME.c -o $BASE_NAME\033[0m" >&2
    exit 2
fi

if [ ! -x "./$EX_NAME" ]; then
    echo -e "\033[31mError:\033[0m $EX_NAME executable not found or not executable\nCopy the file from the example directory." >&2
    exit 2
fi

# Create temporary files for stdout and return codes
TEMP_DIR=$(mktemp -d)
STDOUT1="$TEMP_DIR/$BASE_NAME.stdout"
STDOUT2="$TEMP_DIR/$EX_NAME.stdout"
RETURN1="$TEMP_DIR/$BASE_NAME.return"
RETURN2="$TEMP_DIR/$EX_NAME.return"

# Run both programs, capturing stdout and return codes
./"$BASE_NAME" < "$INPUT_FILE" > "$STDOUT1" 2>/dev/null
EXIT1=$?
echo "$EXIT1" > "$RETURN1"

./"$EX_NAME" < "$INPUT_FILE" > "$STDOUT2" 2>/dev/null
EXIT2=$?
echo "$EXIT2" > "$RETURN2"

# Track test result
RESULT=0

# Compare return codes first
if ! diff -q "$RETURN1" "$RETURN2" > /dev/null; then
    echo -e "\e[31mFAIL:\e[0m Return codes differ"
    echo "  $BASE_NAME return code: $EXIT1"
    echo "  $EX_NAME return code: $EXIT2"
    RESULT=1
fi

# Compare stdout using -Z flag to ignore whitespace differences
if ! diff -Z -q "$STDOUT1" "$STDOUT2" > /dev/null; then
    echo -e "\e[31mFAIL:\e[0m stdout differs for input $(cat "$INPUT_FILE")"
    echo "  $BASE_NAME stdout: '$(cat "$STDOUT1")'"
    echo "  $EX_NAME stdout: '$(cat "$STDOUT2")'"
    RESULT=1
fi

# If both return code and stdout match, print PASS
if [ $RESULT -eq 0 ]; then
    echo -e "\e[32mPASS:\e[0m Return code and stdout identical for input $(cat "$INPUT_FILE")"
    echo "  Output: $(cat "$STDOUT1")"
    echo "  Return Code: $EXIT1"
fi

# Clean up
rm -rf "$TEMP_DIR"

exit $RESULT
