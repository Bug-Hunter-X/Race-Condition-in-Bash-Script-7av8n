#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lockfile.

counter=0
lockfile=/tmp/counter.lock

# Function to increment the counter atomically
increment_counter() {
  # Acquire the lock
  flock $lockfile

  local i=0
  while [ $i -lt 10000 ]; do
    counter=$((counter + 1))
    i=$((i + 1))
  done
  
  # Release the lock
  flock -u $lockfile
}

# Create two processes that increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value. This should be 20000
echo "Final counter value: $counter"