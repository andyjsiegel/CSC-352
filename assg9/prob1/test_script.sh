#!/bin/bash

for i in {1..20}; do
  TEST_CASE=$(printf "test%02d.in" $i)
  TARGET=$(head -n 1 "$TEST_CASE" | cut -d: -f1 | xargs)

  # Run exMymake
  ./exMymake "$TEST_CASE" "$TARGET" > exMymake.out
  EXMYMAKE_EXIT_CODE=$?
  
  # Run mymake
  ./mymake "$TEST_CASE" "$TARGET" > mymake.out
  MYMAKE_EXIT_CODE=$?
  
  # Compare stdout
  if ! diff -q exMymake.out mymake.out > /dev/null; then
    echo "Test case $TEST_CASE: stdout differs"
  fi
  
  # Compare exit codes
  if [ $EXMYMAKE_EXIT_CODE -ne $MYMAKE_EXIT_CODE ]; then
    echo "Test case $TEST_CASE: exit codes differ (exMymake: $EXMYMAKE_EXIT_CODE, mymake: $MYMAKE_EXIT_CODE)"
  fi
done

# Cleanup
rm exMymake.out mymake.out