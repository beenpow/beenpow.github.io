---
layout: post
title : "Leetcode::problem(20) valid parentheses"
subtitle: "Leetcode ps easy"
type: "Leetcod easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2023-07-03"
---

# Leetcode::Valid Parentheses
- [Link : Leetcode::Valid Parentheses](https://leetcode.com/problems/valid-parentheses/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Find if the given string is valid
  - The string only have characters '(', ')', '{', '}', '[', ']'

# Design
- We need to check the close brackets come after open brakcets
  - Also it has to be paired, like '(' -> ')'

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:

    vector<char> stk;
    bool isValid(string s) {
        for(int i = 0; i < s.size(); i++) {
            if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
                stk.push_back(s[i]);
            } else {
                if (stk.empty()) return false;
                if (s[i] == ')') {
                    if (stk.back() != '(') return false;
                }
                else if (s[i] == '}') {
                    if (stk.back() != '{') return false;
                }
                else if (s[i] == ']') {
                    if (stk.back() != '[') return false;
                }else {
                    // Nothing can reach here
                }
                stk.pop_back();
            }
        }
        return stk.size() == 0;
    }
};
```
