#!/bin/bash

doc='input.txt'
# doc='mock.txt'

max_red=12
max_blue=14
max_green=13

while IFS= read -r line; do

    # echo "$line"
    impossible_game=false

    game_id=$(echo "$line" | awk -F ': ' '{print $1}' | awk '{print $2}' )
    sets=$(echo "$line" | sed "s/Game $game_id: //")

    IFS=';' read -ra columns <<< "$line"
    num_sets=${#columns[@]}

    for ((i=1; i<=$num_sets; i++)); do

        case $impossible_game in true) break ;; esac

        set_values[$i]=$(echo $sets | awk -F '; ' '{print $'$i'}')
        # echo -e "\t- ${set_values[$i]}"

        for ((j=1; j<=3; j++)); do

            case $impossible_game in true) break ;; esac

            groups[$j]=$(echo ${set_values[$i]} | awk -F ', ' '{print $'$j'}')
            # echo "${groups[$j]}"

            case $(echo "${groups[$j]}" | awk '{print $2}') in
                red)
                    num_red=$(echo "${groups[$j]}" | awk -F ' ' '{print $1}')
                    if [[ $num_red -gt $max_red ]]; then
                        impossible_game=true
                        break
                    fi
                    ;;
                blue)
                    num_blue=$(echo "${groups[$j]}" | awk -F ' ' '{print $1}')
                    if [[ $num_blue -gt $max_blue ]]; then
                        impossible_game=true
                        break
                    fi
                    ;;
                green)
                    num_green=$(echo "${groups[$j]}" | awk -F ' ' '{print $1}')
                    if [[ $num_green -gt $max_green ]]; then
                        impossible_game=true
                        break
                    fi
                    ;;
                *)  ;;
            esac
        done
    done

    case $impossible_game in
        false) result=$((result + game_id)) ;;
    esac

done < "$doc"

echo "$result"
