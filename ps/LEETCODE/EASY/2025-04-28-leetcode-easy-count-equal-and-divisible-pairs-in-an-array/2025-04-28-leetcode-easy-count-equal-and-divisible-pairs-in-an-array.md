---
layout: post
title : "Leetcode::problem count equal and divisible pairs in an array"
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
date: "2025-04-28"
---

# Leetcode::count equal and divisible pairs in an array
- [Link : Leetcode:count equal and divisible pairs in an array](https://leetcode.com/problems/count-equal-and-divisible-pairs-in-an-array/description/)
- Solved, 10 5 5 0 0
- level : easy

# point
- Given a 0-indexed integer array nums of length n and an integer k, return the number of pairs (i, j) where 0 <= i < j < n, such that nums[i] == nums[j] and (i * j) is divisible by k.

# Design
- Simply, we check all the pairs that match the given condition.

# Big O(time)
- TIME : O(N^2)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int countPairs(vector<int>& nums, int k) {
        int ans = 0;
        for(int i = 0; i < nums.size(); i++) {
            for(int j = i+1; j < nums.size(); j++) {
                if (nums[i] == nums[j] && (i * j) % k == 0) ans++;
            }
        }
        return ans;
    }
};
```