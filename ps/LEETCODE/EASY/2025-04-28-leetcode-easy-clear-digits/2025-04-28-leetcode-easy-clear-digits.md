---
layout: post
title : "Leetcode::problem clear digits"
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

# Leetcode::clear digits
- [Link : Leetcode:clear digits](https://leetcode.com/problems/clear-digits/description/)
- Solved, 3 3 3 0 0
- level : easy

# point
- Return the resulting string after removing all digits.

# Design
- We delete a digit and the non-digit character to its left together.
- After we notice a digit, we need to backtrack a non-digit character.
- To achieve this, I've utilized a string to push and pop a chracter.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    string clearDigits(string s) {
        string t ="";
        for(auto x :s){
            if(x >='0' && x <= '9'){
                if(!t.empty()) t.pop_back();
                else t.push_back(x);
            }else{
                t.push_back(x);
            }
        }
        return t;
    }
};
```