#!/bin/bash

# Write a function called repeatString which repeats the given String src exactly count times.
# repeatStr(6, "I") // "IIIIII"
# repeatStr(5, "Hello") // "HelloHelloHelloHelloHello"

repeat=$1
string=$2

result=""

for (( i=0; i<$repeat; i++ )); do
    result="${result}${string}"
done

echo $result