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

similarity_score=0

for value in "${array_1[@]}"; do
	score=0

	for value2 in "${array_2[@]}"; do
		if [[ $value -eq $value2 ]]; then
			score=$((score + value))
		fi
	done

	similarity_score=$((similarity_score + score))
done

echo "Similarity score: $similarity_score"
