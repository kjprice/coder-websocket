#!/bin/bash

## takes about 2.12 seconds to output 80K bits one at a time
BITS_TO_CREATE=80000

function create_random_bit() {
  # should return either 0 or 1
  echo $((RANDOM % 2))
}

# create 80K bits of random values
for ((COUNT = 0; COUNT < $BITS_TO_CREATE; COUNT++)); do
  create_random_bit
done

