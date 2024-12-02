#!/bin/bash

file=$(cat ../input.txt)

list_1=""
list_2=""

while IFS= read -r line; do
	value_1=$(echo "$line" | awk '{print $1}')
	value_2=$(echo "$line" | awk '{print $2}')

	list_1="$list_1 $value_1"
	list_2="$list_2 $value_2"
done <<< "$file"

# ----------------------

sorted_list_1=$(echo "$list_1" | tr " " "\n" | sort)
sorted_list_2=$(echo "$list_2" | tr " " "\n" | sort)

declare -a array_1
idx=0

while IFS= read -r value; do
	if [[ -n "$value" ]]; then
		array_1[idx]="$value"
		idx=$((idx + 1))
	fi
done <<< "$sorted_list_1"

declare -a array_2
idx=0

while IFS= read -r value; do
	if [[ -n "$value" ]]; then
		array_2[idx]="$value"
		idx=$((idx + 1))
	fi
done <<< "$sorted_list_2"

# ----------------------

total_diff=0
idx=0

for value in "${array_1[@]}"; do
	value_2="${array_2[idx]}"

	if [[ $value > $value_2 ]]; then
		diff=$((value - value_2))
		total_diff=$((total_diff + diff))
	else
		diff=$((value_2 - value))
		total_diff=$((total_diff + diff))
	fi

	idx=$((idx + 1))
done

echo "Total difference: $total_diff"
