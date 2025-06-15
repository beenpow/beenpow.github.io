---
layout: post
title : "Leetcode::problem peak index in a mountain array"
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
date: "2025-06-15"
---

# Leetcode::peak index in a mountain array
- [Link : Leetcode:peak index in a mountain array](https://leetcode.com/problems/peak-index-in-a-mountain-array/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 30 8 0 2
- level : medium

# Problem Description
- A mountain array arr of length n where the values increase to a peak element and then decrease is given.
- Return the index of the peak element.

# How to solve
- To find the peak of the mountain, we can utilize 'mid' points and the next one of it.
- With those two values, we can understand where the 'peak' is positioned.

# Big O (Time, Space)
- Time : O(logN)
- Space : O(1)

# Code

```cpp
class Solution {
public:
    int peakIndexInMountainArray(vector<int>& arr) {
        int lo = 0, hi = arr.size() - 1;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            int midN = mid + 1;
            if (arr[mid] < arr[midN]) {
                lo = midN;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
};
```