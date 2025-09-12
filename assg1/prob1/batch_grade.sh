#!/bin/bash

# Batch grading script for multiple test cases
# Usage: ./batch_grade.sh <base_name> [test_files...]
# If no test files specified, will look for *.in files
# Examples:
#   ./batch_grade.sh countPrimes
#   ./batch_grade.sh calcFactorial test1.in test2.in

if [ $# -lt 1 ]; then
    echo "Usage: $0 <base_name> [test_files...]" >&2
    echo "Examples:" >&2
    echo "  $0 countPrimes" >&2
    echo "  $0 calcFactorial test1.in test2.in" >&2
    exit 2
fi

BASE_NAME="$1"
shift  # Remove first argument, rest are test files

if [ $# -eq 0 ]; then
    # No test files provided, use all .in files
    TEST_FILES=(*.in)
    if [ ! -e "${TEST_FILES[0]}" ]; then
        echo "No .in files found in current directory" >&2
        exit 2
    fi
else
    # Use provided test files
    TEST_FILES=("$@")
fi

PASSED=0
FAILED=0
TOTAL=0

echo "Running batch grading tests for $BASE_NAME vs ex${BASE_NAME^}..."
echo "================================"

for test_file in "${TEST_FILES[@]}"; do
    if [ ! -f "$test_file" ]; then
        echo "Warning: $test_file not found, skipping"
        continue
    fi
    
    echo "Testing: $test_file"
    if ./grade_diff.sh "$BASE_NAME" "$test_file"; then
        ((PASSED++))
    else
        ((FAILED++))
    fi
    ((TOTAL++))
    echo ""
done

echo "================================"
echo "Results: $PASSED passed, $FAILED failed out of $TOTAL total"
echo "Success rate: $(( PASSED * 100 / TOTAL ))%"

if [ $FAILED -eq 0 ]; then
    exit 0
else
    exit 1
fi
