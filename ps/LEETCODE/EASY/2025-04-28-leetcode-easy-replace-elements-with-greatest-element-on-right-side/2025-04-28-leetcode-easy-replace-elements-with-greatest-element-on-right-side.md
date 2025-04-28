---
layout: post
title : "Leetcode::problem replace elements with greatest element on right side"
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

# Leetcode::replace elements with greatest element on right side
- [Link : Leetcode:replace elements with greatest element on right side](https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/)
- Solved, 3 10 20 10 0
- level : easy

# point
- Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

# Design
- It is required to find max element from each element's right side.
- If we iterate from the back(right) of the given array, it only needs a iteration.
- During the iteration, we keep updating the max value.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    vector<int> replaceElements(vector<int>& arr) {
        int mx = -1;
        for(int i = arr.size() - 1; i >= 0; i--) {
            int prev = mx;
            mx = max(mx, arr[i]);
            arr[i] = prev;
        }
        return arr;
    }
};
```