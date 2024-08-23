---
layout: post
title : "Leetcode::problem(680) Valid Palindrome 2"
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
date: "2024-08-23"
---

# Leetcode::Valid Palindrome 2
- [Link : Leetcode::Valid Palindrome 2](https://leetcode.com/problems/valid-palindrome-ii/)

- level : easy
- took 10 mins to solve

# point
- Given a string s, return true if the s can be palindrome after deleting at most one character from it.

# Design
- Since we have one chance to delete a character, we use this when we encounter any difference while iterating to check if the given string is palindrome.
- If we found a different position, we skip either of the different indices and move forward.


# Big O(time)
- TIME : O(N)
- SPACE : constant

# Code

```cpp
class Solution {
public:
    bool IsPalindrome(string s, int lo, int hi) {
        while(lo < hi) if (s[lo++] != s[hi--]) return false;
        return true;
    }
    bool validPalindrome(string s) {
        bool ans = true;
        int lo = 0, hi = s.size() - 1;
        while(lo < hi) {
            if (s[lo] != s[hi]) {
                ans = false;
                ans |= IsPalindrome(s, lo+1, hi);
                ans |= IsPalindrome(s, lo, hi-1);
                break;
            }
            lo++, hi--;
        }
        return ans;
    }
};
```
