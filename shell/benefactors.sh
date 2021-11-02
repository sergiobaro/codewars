#!/bin/bash

new_avg() {
    local trimmed=${1//,/}
    read -ra array <<< "$trimmed"
    local count=${#array[@]}
    
    if (( $count == 0 )); then
        echo $2
        exit
    fi

    local total=$(echo $trimmed | tr ' ' '+' | bc -l)
    local result=$(echo "($2 * ($count + 1)) - $total" | bc -l)
    # local integer=$(printf "%.0f" "$result") # floor
    local integer=$(echo $result | awk '{ print ($0-int($0)>0) ? int($0)+1 : int($0) }') # ceil

    if [ $integer -le 0 ]; then
        echo "ERROR"
    else 
        echo $integer
    fi
}

testing() {
    local expected=$3
    local result=$(new_avg "$1" $2)

    if [ $result == $expected ]; then
        echo "OK"
    else 
        echo "KO: expected: $expected, got: $result"
    fi
}

testing "14 30 5 7 9 11 16" "90" "628"
testing "14 30 5 7 9 11 15" "92" "645"
testing "14 30 5 7 9 11, 15" "2" "ERROR"
testing "1400.25 30000.76 5.56 7 9 11 15.48 120.98" "10000" "58430"
testing "14.25 30.76 5.56 7 9 11 15.48 12.987" "5" "ERROR"
testing "" "90" "90"
testing "175086 66237 173925 70405 57439 173400" "125666.3" "163173"
