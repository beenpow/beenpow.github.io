---
layout: post
title : "Leetcode::problem(14) Longest Common Prefix"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://empire-s3-production.bobvila.com/articles/wp-content/uploads/2021/06/different-types-brick.jpg"
order: 1
date: "2023-07-13"
---

# Leetcode::Longest Common Prefix
- [Link : Leetcode::Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Write a function to find the longest common prefix string amongst an array of strings

# Design
- It's just brute force problem
- Since we only need to find common prefix, we can return if we can't find common character while iterating from left to right

# Big O(time)
- O(N x M)
  - N is the size of strs
  - M is the largest len among strs

# Code

```cpp
class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        string ret = "";
        int pos = 0;
        while(1) {
            for(int i = 0; i < (int)strs.size() - 1; i++) {
                if (pos >= strs[i].size()) return ret;
                if (strs[i][pos] != strs[i+1][pos]) return ret;
            }
            if (pos >= strs.back().size()) return ret;
            ret += strs[0][pos++];
        }
        return ret;
    }
};
```
