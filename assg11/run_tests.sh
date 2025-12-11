#!/bin/bash

# Path to the bacon executable
BACON_EXEC="./prob1/bacon"

# Directory containing test files
TEST_DIR="./prob1"

# Loop through all test files
for test_file in ${TEST_DIR}/test*.in; do
  echo "--- Running tests with movie file: ${test_file} ---"

  # Check if the test file is readable
  if [ ! -r "${test_file}" ]; then
    echo "Error: Cannot read test file ${test_file}"
    continue
  fi

  # Read each actor name from the test file
  while IFS= read -r actor_name || [ -n "${actor_name}" ]; do
    echo "Testing actor: ${actor_name}"
    # Run the bacon program with the actor's name as input
    echo "${actor_name}" | ${BACON_EXEC} "${test_file}"
    echo "----------------------------------------"
  done < "${test_file}"
done
