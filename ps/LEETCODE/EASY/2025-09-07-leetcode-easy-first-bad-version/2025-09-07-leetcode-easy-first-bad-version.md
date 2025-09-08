---
layout: post
title : "Leetcode::problem first bad version"
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
date: "2025-09-07"
---

# Leetcode::first bad version
- [Link : Leetcode:first bad version](https://leetcode.com/problems/first-bad-version/description)
- Solved, 3 3 3 0 0
- level : easy

# Problem Description
- You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
- Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
- You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

# How to solve
- Since the versions are sorted, we can use binary search to find the first bad version.

# Big O (Time, Space)
- TIME : O(logN)
- SPACE : O(1)

# Code

```cpp
// The API isBadVersion is defined for you.
// bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
        long lo = 1, hi = n;
        while (lo < hi) {
            long mi = (lo + hi) / 2;
            if (isBadVersion(mi)) {
                hi = mi;
            } else {
                lo = mi + 1;
            }
        }
        return lo;
    }
};
```