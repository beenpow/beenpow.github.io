---
layout: post
title : "Leetcode::problem move pieces to obtain a string"
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
date: "2025-04-29"
---

# Leetcode::move pieces to obtain a string
- [Link : Leetcode:move pieces to obtain a string](https://leetcode.com/problems/move-pieces-to-obtain-a-string/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 10 5 5
- level : medium

# point
- You are given two string start and target, both of length n.
- Each string consists only of the characters 'L', 'R', and '_'.
- Return true if it is possible to obtain the string target by moving pieces of the string start any number of times.
    - 'L' can move to the left blank.
    - 'R' can move to the right blank.

# Design
- Let's think like there is no blank('_').
- Then we only need to compare the strings sequentially.
- To approach this way, we skip blanks under a while loop.
- Then compare the characters.
- The only thing we need to handle carefully is that 'L' can only move the left side and 'R' can only move to the right side.
- Which means, we need to compare index i from 'start' and index j from 'target'.
- Specifically, for moving right side, i <= j should hold.
    - For moving left side, i >= j should hold.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool canChange(string start, string target) {
        int i = 0, j = 0;
        int n = start.size(), m = target.size();
        while(i < n && j < m) {
            while(i < n && start[i] == '_') i++;
            while(j < m && target[j] == '_') j++;
            if (i == n || j == m) break;
            if (start[i] != target[j])return false;
            if (start[i] == 'L' && i < j) return false;
            if (start[i] == 'R' && i > j) return false;
            i++, j++;
        }
        while(i < n && start[i] == '_') i++;
        while(j < m && target[j] == '_') j++;
        return (i == n) && (j == m);
    }
};
```