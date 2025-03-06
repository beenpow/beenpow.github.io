---
layout: post
title : "Leetcode::problem max consecutive ones"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-03-05"
---

# Leetcode::max consecutive ones
- [Link : Leetcode:max consecutive ones](https://leetcode.com/problems/max-consecutive-ones/description/)
- Solved, 1 1 1 0 0
- level : easy

# point
- Given a binary array nums, return the maximum number of consecutive 1's in the array.

# Design
- We can simply find the maximum number of consecutive 1's by iterating the given array.
- Every time we find '1', adds up the count.
- Every time we find '0', we initialize the count as 0.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int ans = 0;
        int streak = 0;
        bool started = false;
        for(auto x : nums) {
            if (x == 1) {
                if (started == false) {
                    started = true;
                }
                streak++;
            } else {
                ans = max(ans, streak);
                started = false;
                streak = 0;
            }
        }
        ans = max(ans, streak);
        return ans;
    }
};
```
