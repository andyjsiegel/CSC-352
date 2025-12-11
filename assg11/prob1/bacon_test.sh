#!/bin/bash

# --- Configuration ---
BACON_EXEC="bacon"
EXBACON_EXEC="exBacon"
TEST_FILES=$(ls test*.in 2>/dev/null)
VALGRIND_LOG="valgrind_log.txt"

# --- Colors for output ---
COLOR_GREEN="\033[32m"
COLOR_RED="\033[31m"
COLOR_YELLOW="\033[33m"
COLOR_RESET="\033[0m"

# --- Start of Script ---
echo "Starting bacon test script..."

# Clean up previous Valgrind log
if [ -f "$VALGRIND_LOG" ]; then
    rm "$VALGRIND_LOG"
fi

# Check if there are any test files
if [ -z "$TEST_FILES" ]; then
    echo -e "${COLOR_RED}No test files (test*.in) found in ${TEST_DIR}. Exiting.${COLOR_RESET}"
    exit 1
fi

# --- Main Test Function ---
run_tests() {
    local options="$1"
    local description="$2"

    echo "=================================================="
    echo "Running tests ${description}"
    echo "=================================================="

    # --- Main loop for test files ---
    for testfile in $TEST_FILES; do
        echo "--------------------------------------------------"
        echo "Processing movie file: $testfile $options"
        echo "--------------------------------------------------"

        # Read each line from the test file, skipping movie lines
        grep -v '^Movie:' "$testfile" | while IFS= read -r actor_name || [ -n "${actor_name}" ]; do
            # Skip empty or whitespace-only lines
            if [[ -z "${actor_name// }" ]]; then
                continue
            fi

            echo -e "  [TESTING] Actor: '${actor_name}'"

            # --- Run and Compare Implementations ---
            bacon_out=$(echo "${actor_name}" | $BACON_EXEC $options "$testfile" 2>/dev/null)
            bacon_rc=$?

            exbacon_out=$(echo "${actor_name}" | $EXBACON_EXEC $options "$testfile" 2>/dev/null)
            exbacon_rc=$?

            # Compare stdout
            if [ "$bacon_out" == "$exbacon_out" ]; then
                echo -e "${COLOR_GREEN}    [PASS] STDOUT matches.${COLOR_RESET}"
            else
                echo -e "${COLOR_RED}    [FAIL] STDOUT differs.${COLOR_RESET}"
                echo "    --------- bacon stdout ---------"
                echo "$bacon_out"
                echo "    --------- exBacon stdout -------"
                echo "$exbacon_out"
                echo "    --------- diff ------------------"
                diff -u <(echo "$bacon_out") <(echo "$exbacon_out")
                echo "    ---------------------------------"
            fi

            # Compare return codes
            if [ "$bacon_rc" -eq "$exbacon_rc" ]; then
                echo -e "${COLOR_GREEN}    [PASS] Exit codes match (bacon: $bacon_rc, exBacon: $exbacon_rc).${COLOR_RESET}"
            else
                echo -e "${COLOR_RED}    [FAIL] Exit codes differ (bacon: $bacon_rc, exBacon: $exbacon_rc).${COLOR_RESET}"
            fi

            # --- Run Valgrind for Memory Leak Check ---
            echo -e "${COLOR_YELLOW}    [INFO] Running Valgrind on bacon...${COLOR_RESET}"
            valgrind_output=$(echo "${actor_name}" | valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $BACON_EXEC $options "$testfile" 2>&1 >/dev/null)

            if echo "$valgrind_output" | grep -q "All heap blocks were freed -- no leaks are possible"; then
                echo -e "${COLOR_GREEN}    [PASS] Valgrind: No memory leaks detected.${COLOR_RESET}"
            else
                echo -e "${COLOR_RED}    [FAIL] Valgrind: Memory leaks detected.${COLOR_RESET}"
                echo "      -> Details appended to $VALGRIND_LOG"
                {
                    echo "================================================================="
                    echo "Valgrind Leak Report for: $testfile, Actor: $actor_name, Options: $options"
                    echo "================================================================="
                    echo "$valgrind_output"
                    echo ""
                } >> "$VALGRIND_LOG"
            fi
            echo "" # Blank line for readability
        done
    done
}

# --- Execute Tests ---
# First run without the -l option
run_tests "" "(without -l option)"

# Second run with the -l option
run_tests "-l" "(with -l option)"


echo "--------------------------------------------------"
echo "Test script finished."
if [ -f "$VALGRIND_LOG" ]; then
    echo -e "${COLOR_YELLOW}Valgrind detected one or more issues. Please review '$VALGRIND_LOG' for details.${COLOR_RESET}"
fi
echo "--------------------------------------------------"
