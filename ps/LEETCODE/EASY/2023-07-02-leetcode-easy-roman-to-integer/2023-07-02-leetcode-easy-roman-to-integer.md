---
layout: post
title : "Leetcode::problem(13) Roman to Integer"
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
date: "2023-07-02"
---

# Leetcode::Roman to Integer
- [Link : Leetcode::Roman to Integer](https://leetcode.com/problems/roman-to-integer/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- When roman numeral is given, find the number for this

# Design
- Usually roman numerals are written largest to smallest from left to right
  - With this way, just add numbers to the sum
- Othewise, we have to subtract from the larger one
  - This is the only handling point we need


# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    map<char, int> cToValue;
    map<char, int> cToId;

    void init() {
        cToValue['I'] = 1;   cToValue['V'] = 5;
        cToValue['X'] = 10;  cToValue['L'] = 50;
        cToValue['C'] = 100; cToValue['D'] = 500;
        cToValue['M'] = 1000;

        cToId['I'] = 1; cToId['V'] = 2; cToId['X'] = 3;
        cToId['L'] = 4; cToId['C'] = 5; cToId['D'] = 6;
        cToId['M'] = 7;
    }

    int romanToInt(string s) {
        init();
        int ret = 0;
        for(int i = 0; i < (int)s.size(); i++) {
            if (i != (int)s.size() - 1 && cToId[s[i]] < cToId[s[i+1]]) {
                ret += (cToValue[s[i+1]] - cToValue[s[i]]);
                i++;
            } else {
                ret += cToValue[s[i]];
            }
        }
        return ret;
    }
};
```
