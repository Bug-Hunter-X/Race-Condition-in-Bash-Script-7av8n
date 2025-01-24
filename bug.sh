#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

# Function to increment the counter
increment_counter() {
  local i=0
  while [ $i -lt 10000 ]; do
    counter=$((counter + 1))
    i=$((i + 1))
  done
}

# Create two processes that increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value.  It is likely to be less than 20000 due to the race condition
echo "Final counter value: $counter"