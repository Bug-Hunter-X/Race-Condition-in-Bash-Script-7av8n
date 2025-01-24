# Race Condition in Bash Script

This repository demonstrates a common race condition bug in shell scripting.  Two processes concurrently update a shared counter, resulting in an inaccurate final count.  The solution introduces locking to ensure atomic updates.

## Bug Description
The `bug.sh` script illustrates the problem. Two background processes increment a counter, but without proper synchronization, updates can be lost leading to a final counter value less than 20000. 

## Solution
The `bugSolution.sh` script provides a corrected version using a lockfile to prevent concurrent access to the counter.  This ensures that increments happen atomically and that the race condition is avoided.  

## How to Run
1. Clone the repository
2. Run `chmod +x bug.sh bugSolution.sh` to make the scripts executable
3. Run `./bug.sh` to observe the race condition.
4. Run `./bugSolution.sh` to see the correct, thread-safe version.