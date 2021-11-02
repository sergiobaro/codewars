# This time no story, no theory. The examples below show you how to write function accum:

# Examples:
# accum("abcd") -> "A-Bb-Ccc-Dddd"
# accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# accum("cwAt") -> "C-Ww-Aaa-Tttt"
# The parameter of accum is a string which includes only letters from a..z and A..Z.

#!/bin/bash

accum() {
    local uppercase=$( echo "$1" | tr [a-z] [A-Z] )
    local length=${#1}
    local index=1
    local result="${uppercase:0:1}"

    while (( $index < $length )); do
        local character=${uppercase:index:1}
        local lowercase=$( echo "$character" | tr [A-Z] [a-z] )
        
        printf -v sequence '%*s' "$index"
        local sequence=${sequence// /$lowercase}

        result="$result-$character$sequence"

        ((index++))
    done

    echo $result
}

test() {
    local result=$( accum $1 )
    local expected=$2
    if [ "$expected" = "$result" ]; then
        echo "OK"
    else 
        echo "KO: expected $expected, got $result"
    fi
}

test "abcd" "A-Bb-Ccc-Dddd"
test "RqaEzty" "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
test "cwAt" "C-Ww-Aaa-Tttt"
test "ZpglnRxqenU" "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
test "NyffsGeyylB" "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
