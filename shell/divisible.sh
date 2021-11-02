#!/bin/bash

# Create a function that checks if a number n is divisible by two numbers x AND y. 
# All inputs are positive, non-zero digits.

# Examples:
# n = 3, x = 1, y = 3 => true because 3 is divisible by 1 and 3
# n = 12, x = 2, y = 6 => true because 12 is divisible by 2 and 6
# n = 100, x = 5, y = 3 => false because 100 is not divisible by 3
# n = 12, x = 7, y = 5 => false because 12 is neither divisible by 7 nor 5


divisible() {
    (( $1 % $2 == 0 && $1 % $3 == 0 )) && echo "true" || echo "false"
    # if (( $1 % $2 == 0 && $1 % $3 == 0 )); then
    #     echo "true"
    # else
    #     echo "false"
    # fi
}


testing() {
    local expected=$4
    local result=$(divisible $1 $2 $3)

    if [ $result == $expected ]; then
        echo "OK"
    else 
        echo "KO: expected $expected, got $result"
    fi
}

testing 3 3 4 "false"
testing 12 3 4 "true"
testing 9 3 3 "true"
testing 15 3 5 "true"
testing 15 6 3 "false"