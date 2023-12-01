# https://www.reddit.com/r/adventofcode/comments/1883ibu/comment/kbl5cev/?context=3

import re

pattern = r'(?=(one|two|three|four|five|six|seven|eight|nine|\d))'

word_2_num = {
    'one' : '1',
    'two' : '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',

}

# get digit as str
def get_digit(num) -> str:
    if num.isdigit():
        return num
    else:
        return word_2_num[num]

with open ('input.txt', 'r') as f:
    curr_sum = 0

    for line in f:
        nums = ""
        matches = re.findall(pattern, line.strip())

        l = 0
        r = len(matches) - 1

        nums+=get_digit(matches[l])
        nums+=get_digit(matches[r])

        # print(int(nums))

        curr_sum+=(int(nums))

        # with open("sumpy.txt", 'a') as file:
        #     file.write(str(curr_sum) + "\n")

    print(curr_sum)