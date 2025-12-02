#!/bin/bash

# This script automates the testing of the 'mymake' program.
# It compares the output of './mymake' with a reference implementation './exMymake'.
# It also runs 'mymake' through Valgrind to check for memory leaks.

# --- Configuration ---
MYMAKE_EXEC="./mymake2"
EXMYMAKE_EXEC="./exMymake2"
TEST_FILES=$(ls test* 2>/dev/null)
VALGRIND_LOG="valgrind_log.txt"

# --- Start of Script ---
echo "Starting mymake test script..."

# Clean up previous Valgrind log
if [ -f "$VALGRIND_LOG" ]; then
    rm "$VALGRIND_LOG"
fi

# Check if there are any test files
if [ -z "$TEST_FILES" ]; then
    echo "No test files (test*.in) found. Exiting."
    exit 1
fi

# --- Main loop for test files ---
for testfile in $TEST_FILES; do
    echo "--------------------------------------------------"
    echo "Processing test file: $testfile"
    echo "--------------------------------------------------"

    # Extract targets from the makefile.
    # Targets are at the beginning of lines that don't start with a tab and contain a colon.
    # The 'tr' command replaces newlines with spaces for easy iteration.
    targets=$(grep -v '^\t' "$testfile" | grep ':' | cut -d':' -f1 | sed 's/^[ \t]*//;s/[ \t]*$//' | tr '\n' ' ')

    if [ -z "$targets" ]; then
        echo "No targets found in $testfile. Skipping."
        continue
    fi

    # --- Inner loop for targets ---
    for target in $targets; do
        echo "  [TESTING] Target: '$target'"

        # --- Run and Compare Implementations ---
        # Run mymake, capturing stdout and exit code. Stderr is ignored for comparison.
        mymake_out=$($MYMAKE_EXEC "$testfile" "$target" 2>/dev/null)
        mymake_rc=$?

        # Run exMymake, capturing stdout and exit code. Stderr is ignored.
        exmymake_out=$($EXMYMAKE_EXEC "$testfile" "$target" 2>/dev/null)
        exmymake_rc=$?

        # Compare stdout streams
        diff_stdout=$(diff -u <(echo "$mymake_out") <(echo "$exmymake_out"))

        if [ $? -eq 0 ]; then
            echo -e "\033[32m    [PASS] STDOUT matches for target '$target'.\033[0m"
        else
            echo -e "\033[31m    [FAIL] STDOUT differs for target '$target'.\033[0m"
            echo "    --------- mymake stdout ---------"
            echo "$mymake_out"
            echo "    --------- exMymake stdout -------"
            echo "$exmymake_out"
            echo "    --------- diff ------------------"
            echo "$diff_stdout"
            echo "    ---------------------------------"
        fi

        # Compare return codes
        if [ "$mymake_rc" -eq "$exmymake_rc" ]; then
            echo -e "\033[32m    [PASS] Exit codes match for target '$target' (mymake: $mymake_rc, exMymake: $exmymake_rc).\033[0m"
        else
            echo "\033[31m    [FAIL] Exit codes differ for target '$target'.\033[0m"
            echo "      -> mymake exit code: $mymake_rc"
            echo "      -> exMymake exit code: $exmymake_rc"
        fi

        # --- Run Valgrind for Memory Leak Check ---
        echo -e "\033[33m    [INFO] Running Valgrind on mymake for target '$target'...\033[0m"
        # We redirect stdout to /dev/null and capture stderr, where Valgrind writes its report.
        valgrind_output=$(valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $MYMAKE_EXEC "$testfile" "$target" 2>&1 >/dev/null)

        # Check if Valgrind reported that all memory was freed.
        if echo "$valgrind_output" | grep -q "All heap blocks were freed -- no leaks are possible"; then
            echo "    [PASS] Valgrind: No memory leaks detected."
        else
            echo "    [FAIL] Valgrind: Memory leaks detected for target '$target'."
            echo "      -> Details appended to $VALGRIND_LOG"
            # Log the details for review.
            {
                echo "================================================================="
                echo "Valgrind Leak Report for: $testfile, Target: $target"
                echo "================================================================="
                echo "$valgrind_output"
                echo ""
            } >> "$VALGRIND_LOG"
        fi
        echo "" # Add a blank line for better readability
    done
done

echo "--------------------------------------------------"
echo "Test script finished."
if [ -f "$VALgrind_LOG" ]; then
    echo "Valgrind detected one or more issues. Please review '$VALGRIND_LOG' for details."
fi
echo "--------------------------------------------------"
