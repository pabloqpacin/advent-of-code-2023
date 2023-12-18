#!/bin/bash

# doc='input.txt'
doc='mock.txt'

line_count=1

while IFS= read -r line; do

    echo "== Line $line_count =="

    # echo $line | grep -oP '\b\d+\b'
    numbers=$(echo $line | grep -oP '\b\d+\b')
    if [ -n "$numbers" ]; then
        echo "$numbers"
    fi

    # echo $line | grep -oP '[^0-9.]+'
    symbols=$(echo $line | grep -oP '[^0-9.]+')
    if [ -n "$symbols" ]; then
        echo "$symbols"
    fi

    line_count=$((line_count + 1))

done < "$doc"


# 1. Parse numbers
# 2. Parse symbols
# 3. Check if symbol around
# x. Drop/Add number to total