#!/bin/bash

echo "$1" | sed -e 's/[aeiou]//g'