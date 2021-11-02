#!/bin/bash

# My friend John likes to go to the cinema. He can choose between system A and system B.

# System A : he buys a ticket (15 dollars) every time
# System B : he buys a card (500 dollars) and a first ticket for 0.90 times the ticket price, 
# then for each additional ticket he pays 0.90 times the price paid for the previous ticket.
# Example:
# If John goes to the cinema 3 times:

# System A : 15 * 3 = 45
# System B : 500 + 15 * 0.90 + (15 * 0.90) * 0.90 + (15 * 0.90 * 0.90) * 0.90 ( = 536.5849999999999, no rounding for each ticket)
# John wants to know how many times he must go to the cinema so that the final result of System B, when rounded up to the next dollar, will be cheaper than System A.

# The function movie has 3 parameters: card (price of the card), ticket (normal price of a ticket), perc (fraction of what he paid for the previous ticket) and returns the first n such that
# ceil(price of System B) < price of System A.

# More examples:
# movie(500, 15, 0.9) should return 43 
#     (with card the total price is 634, with tickets 645)
# movie(100, 10, 0.95) should return 24 
#     (with card the total price is 235, with tickets 240)

movie() {
    local card=$1
    local ticket=$2
    local perc=$3
    
    local n=1
    local a=$ticket
    local previous_ticket=$( echo "$ticket * $perc" | bc )
    local b=$( echo "$card + $previous_ticket" | bc )
    local ceil_b=$( printf "%.0f" `echo "$b + 0.5" | bc` )

    while (( $( echo "$ceil_b >= $a" | bc ) )); do
        n=$(( $n + 1 ))
        a=$(( $a + $ticket ))
        previous_ticket=$( echo "$previous_ticket * $perc" | bc -l )
        b=$( echo "$b + $previous_ticket" | bc )
        ceil_b=$( printf "%.0f" `echo "$b + 0.5" | bc` )
    done

    echo "$n"
}

test() {
    echo "card: $1, ticket: $2, perc: $3"
    local result=$( movie $1 $2 $3 )
    local expected=$4
    if [ $result = $expected ]; then
        echo "OK"
    else 
        echo "KO: expected: $expected, got $result"
    fi
}

test "500" "15" "0.9" "43"
test "100" "10" "0.95" "24"
test "0" "10" "0.95" "2"
