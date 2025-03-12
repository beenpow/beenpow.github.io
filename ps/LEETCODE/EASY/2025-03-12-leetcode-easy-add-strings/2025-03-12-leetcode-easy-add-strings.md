---
layout: post
title : "Leetcode::problem add strings"
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
date: "2025-03-12"
---

# Leetcode::add strings
- [Link : Leetcode:add strings](https://leetcode.com/problems/add-strings/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 3 5 0 0
- level : easy

# point
- Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

# Design
- To wisely creating a partial calculator, we have proceed from the back of the given string.
- This way, it makes easier to calculate the carry each time.
- Other than that, we make sure the converting(from string to int) properly.

# Big O(time)
- TIME : O(max(N, M))
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    string addStrings(string num1, string num2) {
        int n = num1.size(), m = num2.size();
        reverse(num1.begin(), num1.end());
        reverse(num2.begin(), num2.end());

        string ret = "";
        int i = 0, carry = 0;
        for (i = 0; i < min(n, m); i++) {
            int x = (num1[i] - '0') + (num2[i] - '0');
            ret += to_string((x + carry)%10);
            carry = (x+carry) / 10;
        }


        if (n == m) {
            // do nothing
        } else if (n > m) {
            for(;i < n; i++) {
                int x = (num1[i] - '0');
                ret += to_string((x + carry)%10);
                carry = (x+carry) / 10;
            }
        } else {
            for(;i < m; i++) {
                int x = (num2[i] - '0');
                ret += to_string((x + carry)%10);
                carry = (x+carry) / 10;
            }
        }
        if (carry > 0) ret += to_string(carry);
        reverse(ret.begin(), ret.end());
        return ret;
    }
};
```
