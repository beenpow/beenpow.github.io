---
layout: post
title : "Leetcode::problem minimum cuts to divide a circle"
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

# Leetcode::minimum cuts to divide a circle
- [Link : Leetcode:minimum cuts to divide a circle](https://leetcode.com/problems/minimum-cuts-to-divide-a-circle/)
- Solved, 5 2 2 0 0
- level : easy

# point
- Given the integer n, return the minimum number of cuts needed to divide a circle into n equal slices.
    - Valid cut
        - A straight line that touches two pointers on the edge of the circle and passes through its center.
        - A straight line that touches one point on the edge of the circle and its center.

# Design
- For making n slices,
    - When n is an even number, we only need (n+1)/2 straight lines, since each line divide one piece to two.
    - When n is an odd number, we need n half lines.

# Big O(time)
- TIME : O(1)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int numberOfCuts(int n) {
        if (n == 1) return 0;
        if (n%2) return n;
        else return (n+1)/2;
    }
};
```