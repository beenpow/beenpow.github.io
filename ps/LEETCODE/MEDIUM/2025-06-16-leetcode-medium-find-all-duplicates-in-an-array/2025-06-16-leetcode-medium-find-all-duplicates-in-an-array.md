---
layout: post
title : "Leetcode::problem find all duplicates in an array"
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
date: "2025-06-16"
---

# Leetcode::find all duplicates in an array
- [Link : Leetcode:find all duplicates in an array](https://leetcode.com/problems/find-all-duplicates-in-an-array/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 42
- level : medium

# Problem Description


# How to solve
- Cycle Sort
    - If there is no duplicated numbers, all numbers will be appeared on nums[i] - 1 position.
    - We utilize this fact to solve this problem with cycle sort.
    - During iteration, we find 'nums[i]'s position.
    - It can be positioned from nums[i] - 1.
    - If there is another number on nums[i]-1, we put this on nums[i] position.
    - Then we check if each number is positioned at nums[i]-1.
    - If not, they are the ones appeared twice.

- Mark in the input array
    - The fact that the input numbers are ranged 1 to n is important.
    - It means, if there is no duplicated numbers all numbers from 1 to n exist once in the array.
    - If we use this fact wisely, we can mark on the input array.
    - Specifically, we mark on the 'nums[i] - 1' if we encounter 'nums[i]'.
    - If the value is already less than 0, it means it appeared previously.

# Big O (Time, Space)
- Cycle Sort
    - Time : O(N)
    - SPACE : O(1) (except the output array)
- Mark in the input array
    - Time : O(N)
    - SPACE : O(1) (except the output array)

# Code

## Cycle Sort

```cpp
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        int i = 0;
        while(i < nums.size()) {
            int correctPos = nums[i] - 1;
            if (nums[correctPos] != nums[i]) {
                swap(nums[correctPos], nums[i]);
            } else i++;
        }

        vector<int> ans;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != i + 1) ans.push_back(nums[i]);
        }
        return ans;
    }
};
```

## Mark in the input array

```cpp
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        vector<int> ans;
        for(auto num : nums) {
            int id = abs(num) - 1;
            if (nums[id] < 0) ans.push_back(abs(num));
            else {
                nums[id] *= -1;
            }
        }
        return ans;
    }
};
```