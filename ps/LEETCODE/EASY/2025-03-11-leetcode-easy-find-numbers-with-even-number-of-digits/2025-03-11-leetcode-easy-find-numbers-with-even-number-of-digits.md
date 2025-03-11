---
layout: post
title : "Leetcode::problem find numbers with even number of digits"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-03-11"
---

# Leetcode::find numbers with even number of digits
- [Link : Leetcode:find numbers with even number of digits](https://leetcode.com/problems/find-numbers-with-even-number-of-digits/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 1 1 1 0 1
- level : easy

# point
- Given an array nums of integers, return how many of them contain an even number of digits.

# Design
- I've solved with string.
- Also, solving the problem with logarithm seems nice too. (Check out the Code section)


# Big O(time)
- TIME : O(NlogM)
  - M is the maximum given number.
	- It takes O(logM) to count the length of the number.
- Space : O(1)

# Code

```cpp
class Solution {
public:
    int findNumbers(vector<int>& nums) {
        int ans = 0;
        for(auto x : nums) {
            //if (to_string(x).size() % 2 == 0) ans++;
            if ( ((int) floor (log10(x)) + 1) %2 == 0) ans++;
        }
        return ans;
    }
};
```
