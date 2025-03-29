---
layout: post
title : "Leetcode::problem valid anagram"
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
date: "2025-03-29"
---

# Leetcode::valid anagram
- [Link : Leetcode:valid anagram](https://leetcode.com/problems/valid-anagram/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 1 1 1 1 0
- level : easy

# point
- Given two strings s and t, return true if t is an anagram of s, and false otherwise.

# Design
- We are able to check if t is an anagram by counting characters from both given strings.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool isAnagram(string s, string t) {
        int cnt[26];
        for(auto c : s) cnt[c - 'a']++;
        for(auto c : t) cnt[c - 'a']--;
        for(int i = 0; i < 26; i++) if (cnt[i]) return false;
        return true;
    }
};
```