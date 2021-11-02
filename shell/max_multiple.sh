#!/bin/bash

max_multiple() {
    echo $(( $2 - ($2 % $1) ))
    # local d=$1
    # local b=$2

    # while [ b > 0 ]; do
    #     if (( $b % $d == 0 )); then
    #         echo $b
    #         break
    #     fi

    #     b=$(( $b - 1 ))
    # done
}

# Testing

test() {
    local expected=$3
    local result=$( max_multiple $1 $2 )
    if (( $expected == $result )); then
        echo "OK"
    else
        echo "FAIL: expected ${expected}, got: ${result}"
    fi
}

test 2 7 6
test 3 10 9
test 7 17 14
test 10 50 50
test 37 200 185
test 7 100 98