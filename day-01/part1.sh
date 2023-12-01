#!/bin/bash

result=''

doc='input.txt'

# doc='mock.txt'
# lines='lines.txt'
# sum='sum.txt'

while IFS= read -r line; do

    first_digit=$(echo $line | grep -E -o '[0-9]' | head -n 1)
    last_digit=$(echo $line | grep -E -o '[0-9]' | tail -n 1)
    two_digit="${first_digit}${last_digit}"
    
    result=$((result + two_digit))
    
    # echo "$two_digit" >> $lines
    # echo "$result" >> $sum
    
done < "$doc"

echo "$result"
