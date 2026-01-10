---
layout: post
title : "Leetcode::problem special binary string"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2026-01-09"
---

# Leetcode::special binary string
- [Link : Leetcode:special binary string](https://leetcode.com/problems/special-binary-string)
- Solved, algorithm 180
- level : hard

# Problem Description
- Special binary strings are binary strings with the following two properties:
- The number of 0's is equal to the number of 1's.
- Every prefix of the binary string has at least as many 1's as 0's.
- Return the lexicographically largest resulting string possible after applying the mentioned operations on the string.

# How to solve
- The Editorial suggests a interesting way of solving this problem.
- It introduces mountains.
- There is a value named balance.
    - When we meet '1', we add one to this.
    - When we meet '0', we deduct on from this.
- If the balance becomes 0, it means this range is special binary string.
- To make this substring - 'sbs' as the lexicographically largest, we recursivecly call a function except the first value (1) and the last value(0).
- Why we delete the front  and back?
    - Because it's always 1 and 0.
    - Also, we can manage the length of strings to be shrinked, so that we can terminate the recursive function call.
- The key point that we have to understand first is this:
    - If we can decompose a special binary string, the decomposed substrings are always special binary string.
    - Because of the given two factors of special binary string holds.
    - If we find a mountain, the next one is always mountain.
        - After mountain, we can not meet like, "010110" which is not 'sbs'.
- If we fully understand above key factors, it's a solvable problem.

# Big O (Time, Space)
- TIME : O(N^2)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    string makeLargestSpecial(string s) {
        int balance = 0;
        int st = 0;
        vector<string> sbs;
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == '1') balance++;
            else balance--;

            if (balance == 0) {
                string best = "1" + makeLargestSpecial(s.substr(st + 1, i - st  - 1)) + "0";
                sbs.push_back(best);
                st = i + 1;
            }
        }
        string ret = "";
        sort(sbs.rbegin(), sbs.rend());
        for(auto x : sbs) ret += x;
        return ret;
    }
};
```