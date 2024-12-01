# Advent of Code 2024

This repository contains my solutions to the 2024 Advent of Code puzzles, implemented in Lua.
Each day’s challenge is placed in its own dedicated sub-folder, making it easy to navigate through the various problems.

I'd recommend trying to solve each puzzle before taking a looking at how I solved it.

[Advent of Code](https://adventofcode.com/)


<details>
<summary>Day 1: Historian Hysteria</summary>

### Puzzle 1: Calculate the Total Distance

The Chief Historian has gone missing, and the Senior Historians need help to reconcile two lists of historically significant locations (represented by location IDs).

**Goal**: Solve two puzzles to help the Historians reconcile the lists and collect stars.

**Task**: Pair the smallest numbers in both lists and calculate the distance between them. Repeat this for all numbers in both lists.
**Steps**:
- Sort both lists.
- Pair corresponding elements from each list.
- Calculate the absolute difference for each pair.
- Sum the differences.
**Example**:
- Lists: `[3, 4, 2, 1, 3, 3]` and `[4, 3, 5, 3, 9, 3]`
- Total distance = `2 + 1 + 0 + 1 + 2 + 5 = 11`

### Puzzle 2: Calculate the Similarity Score

**Task**: For each number in the left list, count how many times it appears in the right list and multiply it by the number. Sum these values to get the similarity score.
**Steps**:
- For each element in the left list, count its occurrences in the right list.
- Multiply the element by its count in the right list.
- Sum all the results.
**Example**:
- Lists: `[3, 4, 2, 1, 3, 3]` and `[4, 3, 5, 3, 9, 3]`
- Similarity score = `9 + 4 + 0 + 0 + 9 + 9 = 31`

[View more](./day_1)
</details>
