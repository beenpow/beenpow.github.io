---
layout: post
title : "Leetcode::problem remove duplicates from sorted array ii"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-12-20"
---

# Leetcode::remove duplicates from sorted array ii
- [Link : Leetcode:remove duplicates from sorted array ii](https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description)
- Solved, 5 15 5 0 1
- level : medium

# Problem Description
- Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice.
- The relative order of the elements should be kept the same.
- Return k after placing the final result in the first k slots of nums.

# How to solve
- There's constrain that we have to solve the problem in-place.
- Since the given array is sorted in non-decreasing order, all duplicate numbers are adjacent.
- Based on the above fact, we are able to find how many numbers exist, so we know if there are more than two same numbers.
- If there is a number that has more than two consecutive numbers, we find the next different number, and swap them.
- So, we will need two variables.
    - i : for the iteration.
    - j : for the position that we will swap (to work as some kind of delete operation).

# Big O (Time, Space)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int cnt = 1;
        int i = 1, j = 1, n = nums.size();

        while (i < n) {
            if (nums[i-1] == nums[i]) cnt++;
            else cnt = 1;

            if (cnt < 3) nums[j++] = nums[i++];
            else {
                i++;
                while (i < n && nums[i-1] == nums[i]) i++;
            }
        }

        return j;
    }
};
```