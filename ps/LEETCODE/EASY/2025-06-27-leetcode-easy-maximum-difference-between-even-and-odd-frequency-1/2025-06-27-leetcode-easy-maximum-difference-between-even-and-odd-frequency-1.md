---
layout: post
title : "Leetcode::problem maximum difference between even and odd frequency 1"
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
date: "2025-06-27"
---

# Leetcode::maximum difference between even and odd frequency 1
- [Link : Leetcode:maximum difference between even and odd frequency 1](https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-i)
- Solved, 2 4 4 0 0
- level : easy

# Problem Description
- You are given a string s consisting of lowercase English letters.
- Your task is to find the maximum difference diff = freq(a1) - freq(a2) between the frequency of the characters a1 and a2 in the string such that:
    - a1 has an odd frequency in the string.
    - a2 has an even frequency in the string.
- Return this maximum difference.

# How to solve
- We can use a map to count the frequency of each character in the string.
- After counting them, we find the maximum frequency of odd and minimum frequency of even.

# Big O (Time, Space)
- Time : O(n)
- Space : O(26)

# Code

```cpp
class Solution {
public:
    int maxDifference(string s) {
        map<int, int> cnt;
        int odd = 0, even = s.size();
        for(int i = 0; i < s.size(); i++) {
            cnt[s[i]]++;
        }

        for(auto x : cnt) {
            if (x.second % 2 == 0) {
                even = min(even, x.second);
            } else {
                odd = max(odd, x.second);
            }
        }
        return odd - even;
    }
};
```