---
layout: post
title : "Leetcode::problem fizz buzz"
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
date: "2025-02-15"
---

# Leetcode::fizz buzz
- [Link : Leetcode:fizz buzz](https://leetcode.com/problems/fizz-buzz/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 3 3 0 0
- level : easy

# point
- Given an integer n, return a string array answer where:
	- answer[i] = "FizzBuzz" if i is divisible by 3 and 5.
	- answer[i] = "Fizz" if i is divisible by 3.
	- answer[i] = "Buzz" if i is divisible by 5.
	- answer[i] = i if none of the above conditions are true.

# Design
- Simple implementation problem.
- We dicide what to append by checking a number is divisible by 3 and 5.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    vector<string> fizzBuzz(int n) {
        vector<string> ret;
        for(int i = 1; i <= n; i++) {
            bool three = (i % 3 == 0);
            bool five  = (i % 5 == 0);

            string s = "";
            if (three) s = "Fizz";
            if (five) s += "Buzz";
            if (s == "") ret.push_back(to_string(i));
            else ret.push_back(s);
            
        }
        return ret;
    }
};
```
