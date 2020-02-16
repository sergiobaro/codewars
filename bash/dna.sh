#!/bin/sh

# Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and carries the 
#  "instructions" for the development and functioning of living organisms.
# If you want to know more http://en.wikipedia.org/wiki/DNA
# In DNA strings, symbols "A" and "T" are complements of each other, 
#  as "C" and "G". You have function with one side of the DNA (string, except for Haskell); 
#  you need to get the other complementary side. DNA strand is never empty or there is no DNA 
#  at all (again, except for Haskell).


echo $1 | tr 'ATCG' 'TAGC'

# dna=$1
# result=""

# for (( i=0; i<${#dna}; i++ )); do
#     char="${dna:$i:1}"
#     if [[ "$char" == "A" ]]; then
#         result="${result}T"
#     elif [[ "$char" == "T" ]]; then
#         result="${result}A"
#     elif [[ "$char" == "C" ]]; then
#         result="${result}G"
#     else
#         result="${result}C"
#     fi
# done

# echo $result