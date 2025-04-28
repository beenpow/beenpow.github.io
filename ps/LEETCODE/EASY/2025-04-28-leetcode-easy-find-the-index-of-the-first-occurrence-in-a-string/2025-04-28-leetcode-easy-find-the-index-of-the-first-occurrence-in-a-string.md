---
layout: post
title : "Leetcode::problem find the index of the first occurrence in a string"
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

# Leetcode::find the index of the first occurrence in a string
- [Link : Leetcode:find the index of the first occurrence in a string](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/)
- Solved, 3 3 5 0 0
- level : easy

# point
- Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# Design
- We check if needle string is included in haystack by using 'substr'.

# Big O(time)
- TIME : O(NM)
    - N : length of haystack
    - M : length of needle
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int strStr(string haystack, string needle) {
        if (haystack.size() < needle.size()) return -1;
        for(int i = 0; i < haystack.size() - needle.size() + 1; i++) {
            if (haystack.substr(i, needle.size()) == needle) return i;
        }
        return -1;
    }
};
```