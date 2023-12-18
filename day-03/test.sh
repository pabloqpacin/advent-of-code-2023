doc='mock.txt'

line_count=1

while IFS= read -r line; do
    echo "== Line $line_count =="

    for ((i = 0; i < ${#line}; i++)); do
        char="${line:$i:1}"

        # Your character-level processing goes here
        # For example, you can check if the character is a number or a symbol
        if [[ "$char" =~ [0-9.] ]]; then
            # echo "Number at position $((i+1)): $char"
            foo=bar
        else
            # echo "Symbol at position $((i+1)): $char"
            symbol_position=$((i+1))
            echo "$symbol_position"
        fi
    done

    line_count=$((line_count + 1))

done < "$doc"
