---
layout: post
title : "Leetcode::problem smallest missing non negative integer after operations"
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
date: "2025-10-27"
---

# Leetcode::smallest missing non negative integer after operations
- [Link : Leetcode:smallest missing non negative integer after operations](https://leetcode.com/problems/smallest-missing-non-negative-integer-after-operations/)
- Solved, 5 10 13 0 0
- level : medium

# Problem Description
- You are given a 0-indexed integer array nums and an integer value.
- In one operation, you can add or subtract value from any element of nums.
- Return the maximum MEX of nums after applying the mentioned operation any number of times.

# How to solve
- We are allowed to use as many times of operations as we need.
- First of all, we compress the given nums into a range between 0 and value.
- Because there are some numbers that can be same value after some amount of adds and subtracts, cnt can be greater than 0.
- Then we check from 0 if we have a count for this number.

# Big O (Time, Space)
- Time : O(N)
- Space : O(value)

# Code

```cpp
class Solution {
public:
    int findSmallestInteger(vector<int>& nums, int value) {
        vector<int> cnt(value + 1, 0);
        for (auto num : nums) {
            int x = (num % value + value) % value;
            cnt[x]++;
        }
        int curr = 0;
        while(true) {
            int ncurr = curr % value;
            if (cnt[ncurr] == 0) break;
            cnt[ncurr]--;
            curr++;
        }
        return curr;
    }
};
```