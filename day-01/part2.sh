#!/bin/bash

result=''

doc='input.txt'
# doc='mock.txt'

if [[ -f $lines ]]; then rm lines.txt; fi
if [[ -f $sum ]]; then rm sum.txt; fi


while IFS= read -r line; do

    first_pattern=$(echo "$line" | grep -E -o "one|two|three|four|five|six|seven|eight|nine|[0-9]" | head -n 1)
    last_pattern=$(echo "$line" | rev | grep -E -o "eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|[0-9]" | head -n 1)

    case $first_pattern in
        one)    first_digit='1' ;;
        two)    first_digit='2' ;;
        three)  first_digit='3' ;;
        four)   first_digit='4' ;;
        five)   first_digit='5' ;;
        six)    first_digit='6' ;;
        seven)  first_digit='7' ;;
        eight)  first_digit='8' ;;
        nine)   first_digit='9' ;;
        *)      first_digit=$first_pattern ;;
    esac

    case $last_pattern in
        eno)    last_digit='1' ;;
        owt)    last_digit='2' ;;
        eerht)  last_digit='3' ;;
        ruof)   last_digit='4' ;;
        evif)   last_digit='5' ;;
        xis)    last_digit='6' ;;
        neves)  last_digit='7' ;;
        thgie)  last_digit='8' ;;
        enin)   last_digit='9' ;;
        *)      last_digit=$last_pattern ;;
    esac

    two_digit="${first_digit}${last_digit}"
        # echo "$two_digit" >> $lines
    
    result=$((result + two_digit))
        # echo "$result" >> $sum
    
done < "$doc"

echo "$result"
