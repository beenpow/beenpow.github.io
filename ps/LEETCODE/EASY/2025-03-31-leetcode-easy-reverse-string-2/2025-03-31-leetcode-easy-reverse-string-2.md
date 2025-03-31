---
layout: post
title : "Leetcode::problem reverse string 2"
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
date: "2025-03-31"
---

# Leetcode::reverse string 2
- [Link : Leetcode:reverse string 2](https://leetcode.com/problems/reverse-string-ii/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 1 1 1 1 0
- level : easy

# point
- Given a string s and an integer k, reverse the first k characters for every 2k characters counting from the start of the string.

# Design
- We reverse 'k' elements, then skip next 'k' elements.
- We can achieve this target by using for loop with 'i += k'.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    string reverseStr(string s, int k) {
        for(int i = 0; i < s.size(); i += k) {
            int le = i, ri = min(i + k - 1, (int)s.size() - 1);
            while(le < ri) swap(s[le++], s[ri--]);
            i += k;
        }
        return s;
    }
};
```